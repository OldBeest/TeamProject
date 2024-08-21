#!/usr/bin/env python
# coding: utf-8

# ## 가상환경설정
#     아나콘다 가상환경 설정하기
#   - conda create -n med_chatbot python=3.9
#   - conda activate  med_chatbot
#   - pip install torch==1.12.0 torchvision==0.13.0 torchaudio==0.12.0 (cpu만 사용할때)
#   - pip install python-mecab-ko
#   - pip install sentence-transformers
#   - pip install pandas
#   - pip install matplotlib
#   - pip install numpy==1.26.4 (제일 중요!(numpy가 2.0.1로 깔려있지만, 원활한 함수 사용을 위해 1.26.4로 다운그레이드 해줘야함))

# In[6]:


import torch
from torch.utils.data import Dataset
from torchvision import datasets
from torchvision.transforms import ToTensor
import numpy as np
import pandas as pd
from sentence_transformers import util
from mecab import MeCab

import json
from glob import glob


# ## json 데이터 불러와 데이터 프레임 만들기
#  1. glob으로 해당 폴더 모든 json 파일경로를 list로 불러옴
#  2. json.load를 이용해 질문, 답변, 의도를 각각 리스트에 모두 담는다
#  3. 질문, 답변, 의도에 대한 데이터 프레임을 만들고 concat으로 하나의 데이터프레임으로 합친다

# In[7]:


def all_data(path1, path2):
    question_path = path1
    answer_path = path2

    return glob(question_path + '/*'), glob(answer_path + '/*')


# In[8]:


disease_q_path, disease_a_path = all_data('./training/라벨링데이터/질문/' , './training/라벨링데이터/답변/') # 경로 입력


# In[9]:


disease_q_path # q_data : 의도별 폴더


# In[10]:


q_list = []
a_list = []
i_list = []
for intention_q_path, intention_a_path in zip(disease_q_path, disease_a_path):
    intention_q_folders, intention_a_folders = glob(intention_q_path + '/*'), glob(intention_a_path + '/*')
    
    for q_intention, a_intention  in zip(intention_q_folders, intention_a_folders):
        q_json_files = glob(q_intention + '/*')
        a_json_files = glob(a_intention + '/*')
        
        # print(q_intention, len(q_json_files), a_intention, len(a_json_files))
        # print(min([len(q_json_files), len(a_json_files)]))
        
        for idx in range(min([len(q_json_files), len(a_json_files)])):
            with open(q_json_files[idx], 'r', encoding='utf-8') as file:
                q_json_data = json.load(file)
                q_list.append(q_json_data['question'])
                i_list.append(q_json_data['intention'])
            with open(a_json_files[idx], 'r', encoding='utf-8') as file:
                a_json_data = json.load(file)
                sentence = ""
                for key in a_json_data['answer'].keys():
                    sentence += a_json_data['answer'][key]
                a_list.append(sentence)


# In[11]:


q_df = pd.DataFrame(q_list)
i_df = pd.DataFrame(i_list)
a_df = pd.DataFrame(a_list)


# In[12]:


df = pd.concat((q_df, i_df, a_df), axis=1)
df.columns = ['question', 'intention', 'answer']


# In[13]:


df


# In[14]:


df.to_csv("dementia_fix.csv", sep=',', encoding='utf-8')


# In[15]:


# df = df.sample(frac=1).reset_index(drop=True)
# df.to_csv("dementia_shuffle.csv", sep=',', encoding='utf-8')


# In[16]:


# def all_data(path1, path2):
#     question_path = path1
#     answer_path = path2

#     return glob(question_path + '/*/*.json'), glob(answer_path + '/*/*.json')


# In[17]:


# q_data, a_data = all_data('./dementia/training/원천데이터/질문/치매', './dementia/training/원천데이터/답변/치매') # 경로 입력


# In[18]:


# # 치매 데이터 개수 확인 (질문, 답변)
# len(q_data), len(a_data)


# In[19]:


# with open(q_data[1000], 'r', encoding='utf-8') as file:
#     json_data = json.load(file)
#     print(json_data)


# In[20]:


# q_list = []
# for i in range(len(q_data)):
#     with open(q_data[i], 'r', encoding='utf-8') as file:
#         json_data = json.load(file)
#         q_list.append(json_data['question'])


# In[21]:


# a_list = []
# for i in range(len(q_data)):
#     with open(a_data[i], 'r', encoding='utf-8') as file:
#         json_data = json.load(file)
#         sentence = ""
#         for key in json_data['answer']:
#             sentence += json_data['answer'][key]
#         a_list.append(sentence)


# In[22]:


# i_list=[]
# for i in range(len(q_data)):
#     with open(q_data[i],'r',encoding='utf-8') as file:
#         json_data=json.load(file)
#         sentence = ""
#         sentence += json_data['intention']
#         i_list.append(sentence)


# In[23]:


# df = pd.read_csv('dementia_shuffle.csv', encoding='utf-8', index_col=0)


# In[24]:


# # 데이터 프레임 만들기
# q_df = pd.DataFrame(q_list) # 질문 데이터 프레임
# a_df = pd.DataFrame(a_list) # 답변 데이터 프레임
# i_df = pd.DataFrame(i_list) # 의도 데이터 프레임
# qa_df = pd.concat((q_df, a_df), axis=1) # 질문-의도 데이터 프레임
# qa_df.columns=['question', 'answer']
# qi_df = pd.concat((q_df, i_df), axis=1) # 질문-답변 데이터 프레임
# qi_df.columns=['question', 'intention']
# df = pd.concat((q_df, i_df, a_df), axis=1) # 질문-의도-답변 데이터 프레임
# df.columns=['question', 'intention', 'answer']


# In[25]:


# # csv 파일로 저장
# df.to_csv("dementia_qia.csv", sep=',') #질문, 의도, 답변 포함
# qa_df.to_csv("dementia_qa.csv", sep=',') #질문, 답변
# qi_df.to_csv("dementia_qi.csv", sep=',') #질문, 의도 -> 나중에 의도 분류 모델에 활용할수도 ?


# In[26]:


q_data = df['question']
a_data = df['answer']


# In[27]:


q_data


# In[28]:


# 형태소 분석 불러오기
from mecab import MeCab
m = MeCab()

# 각 질문마다 형태소 분석을 통해 질문당 몇 개의 단어 토큰이 들어갔는지 count리스트에 담음
count = []
for q in q_data:
        count_num = len(m.morphs(q))
        count.append(count_num)
len(count)


# In[29]:


question = df['question']
answer = df['answer']
intention = df['intention']
df['answer']


# In[30]:


# 각 질문마다 형태소 분석을 통해 답변당 몇 개의 단어 토큰이 들어갔는지 count1 리스트에 담음

count1 = []
for a in a_data:
    count_num = len(m.morphs(a))
    count1.append(count_num)
len(count1)


# In[31]:


# 질문에 사용된 단어 개수

import matplotlib.pyplot as plt

plt.hist(count)
point_6 = np.percentile(count, q=[0, 50, 75, 90, 95, 99]) # 상위 0%, 50%, 75%, 90%, 95%, 99% 구간으로 나눠서 분포 그리기
print(point_6)


# In[32]:


# 답변에 사용된 단어 개수 ()

plt.hist(count1)
point1_6 = np.percentile(count1, q=[0, 50, 75, 90, 95, 99]) # 상위 0%, 50%, 75%, 90%, 95%, 99% 구간으로 나눠서 분포 그리기
print(point1_6)


# In[33]:


import re

# 한글, 영어, 숫자, 공백, ?!.,을 제외한 나머지 문자 제거
korean_pattern = r'[^ ?,.!A-Za-z0-9가-힣+]'

# 패턴 컴파일
normalizer = re.compile(korean_pattern)
normalizer


# In[34]:


# 불용어 처리 (그런데 이미 불용어 처리된 데이터라 변화가 거의 없음)
print(f'수정 전: {question[20]}')
print(f'수정 후: {normalizer.sub("", question[20])}')
print(f'수정 전: {answer[20]}')
print(f'수정 후: {normalizer.sub("", answer[20])}')


# In[35]:


def normalize(sentence):
    return normalizer.sub("", sentence)

normalize(question[20])


# In[36]:


# 형태소 분석 돌려보기
mecab = MeCab()
mecab.morphs(normalize(question[20]))


# In[37]:


# 한글 전처리를 함수화
def clean_text(sentence, mecab):
    sentence = normalize(sentence)
    sentence = mecab.morphs(sentence)
    sentence = ' '.join(sentence)
    sentence = sentence.lower()
    return sentence


# In[38]:


# 한글
clean_text(question[20], mecab)
clean_text(answer[20], mecab)


# In[39]:


# 질문과 답변을 형태소 분석한 결과를 각각 리스트에 모두 담음
questions = [clean_text(sent, mecab) for sent in question.values[:len(question)]]
answers = [clean_text(sent, mecab) for sent in answer.values[:len(question)]]


# In[40]:


questions[:5]


# In[41]:


answers[:5]


# ## seq2seq 모델
#  1. 질문과 답변 내용을 모두 형태소 분석하여 큰 단어사전을 만듬

# In[42]:


import torch.nn as nn
from torch import optim
import torch.nn.functional as F
from torch.utils.data.dataset import Dataset

device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")
device


# In[43]:


PAD_TOKEN = 0 # 빈공간 채워주는 토큰
SOS_TOKEN = 1 # 문장의 시작점을 표시하는 토큰
EOS_TOKEN = 2 # 문장의 끝을 표시하는 토큰

# 단어사전 클래스
class WordVocab():
    def __init__(self):
        self.word2index = {
            '<PAD>': PAD_TOKEN,
            '<SOS>': SOS_TOKEN, 
            '<EOS>': EOS_TOKEN,
        }
        self.word2count = {}
        self.index2word = {
            PAD_TOKEN: '<PAD>', 
            SOS_TOKEN: '<SOS>', 
            EOS_TOKEN: '<EOS>'
        }
        
        self.n_words = 3  # PAD, SOS, EOS 포함

    def add_sentence(self, sentence):
        
        # for word in sentence.split(' '):
        for word in mecab.morphs(sentence): # 문장을 형태소 분석 함수에 돌리면 각 형태소가 담긴 리스트가 나오기 때문에 바로 반복문으로 하나씩 단어사전에 추가해준다.
            self.add_word(word)

    def add_word(self, word): # word2index : 단어를 번호로 바꿔주는 딕셔너리, word2count : 해당 단어가 몇번 쓰였는지 횟수를 나타내는 딕셔너리, index2word : 번호를 단어로 바꿔주는 딕셔너리
        if word not in self.word2index: # 해당 단어가 단어사전에 없는 경우 번호를 매겨주고, 단어사전에 추가한다.
            self.word2index[word] = self.n_words 
            self.word2count[word] = 1 
            self.index2word[self.n_words] = word
            self.n_words += 1 
        else:
            self.word2count[word] += 1 


# In[44]:


# 테스트로 질문과 답변을 lang1이란 단어사전 클래스를 만들어서 넣어보기
lang1 = WordVocab()
for q in question:
    lang1.add_sentence(q)
for a in answer:
    lang1.add_sentence(a)
    


# In[45]:


lang1.word2index


# In[46]:


# 문장 하나 가져와서 단어사전에 추가해서 확인 (테스트용 코드)
print(f'원문: {questions[550]}')
lang = WordVocab()
lang.add_sentence(questions[550])
print('==='*10)
print('[단어사전]')
print('***'*10)
print(lang.word2index)


# In[47]:


# 문장 생성 테스트(나중에 데이터셋 만들때 필요한 과정)

max_length = 50 # 문장을 담을 길이를 정하기
sentence_length = 30 # 입력할 문장길이

sentence_tokens = np.random.randint(low=3, high=100, size=(sentence_length,)) # 랜덤으로 단어 뽑아오기(3번~100까지)
sentence_tokens = sentence_tokens.tolist() 
print(f'Generated Sentence: {sentence_tokens}')

sentence_tokens = sentence_tokens[:(max_length-1)]

token_length = len(sentence_tokens)

# 문장의 맨 끝부분에 <EOS> 토큰 추가
sentence_tokens.append(2)

for i in range(token_length, max_length-1):
    # 나머지 빈 곳에 <PAD> 토큰 추가
    sentence_tokens.append(0)

print(f'Output: {sentence_tokens}')
print(f'Total Length: {len(sentence_tokens)}')


# ## 학습용 데이터 만들기(여기가 중요!)
#  1. csv파일에서 질문, 답변 데이터를 읽어와 데이터 프레임을 만듬
#  2. 질문, 답변내용에서 형태소 분석(mecab 사용)을 이용해 단어사전을 만듬
#  3. 질문내용은 30개 토큰, 답변 내용은 300개 토큰을 사용 (q_max_length, a_max_length로 조절할 수 있음)
#  4. 입력 문장을 단어사전을 이용해 숫자로 변환한 후 리스트로 만듬 ex) "치매에 좋은 운동은 뭐가 있나요?" -> [치매에, 좋은, 운동, 은, 뭐가, 있나요?] -> [2, 4, 5, 6, 7, 8, 0.....,0](길이가 30인 숫자 리스트로 변환)
#  5. 답변 문장도 같은 형식으로 길이가 300인 리스트로 변환
#  6. 의도는 각 단어마다 번호를 매겨 하나의 숫자로 변환
#  7. 출력은 {"answer" : 답변내용문자열, "intention" : 의도에 해당하는 숫자} 형태의 딕셔너리로 만들었음
#  8. 그리고 각 input값과 출력값은 학습시키려면 tensor로 변환시켜줘야하기 때문에, torch.tensor()함수로 감싸서 텐서형태로 만들어줌

# In[48]:


class TextDataset(Dataset):
    def __init__(self, csv_path, min_length=3, max_length1=50, q_max_length=30, a_max_length=300):
        super(TextDataset, self).__init__()
        # data_dir = 'data'
        
        # TOKEN 정의
        self.PAD_TOKEN = 0 # Padding 토큰
        self.SOS_TOKEN = 1 # SOS 토큰
        self.EOS_TOKEN = 2 # EOS 토큰
        
        self.tagger = MeCab()   # 형태소 분석기
        self.max_length1 = max_length # 한 문장의 최대 길이 지정
        self.q_max_length = q_max_length # 질문 길이 최대 지정
        self.a_max_length = a_max_length # 답변 길이 최대 지정
        
        # CSV 데이터 로드
        # df = pd.read_csv(os.path.join(data_dir, csv_path))
        df=pd.read_csv('dementia_fix.csv') # 질문, 답변, 의도가 저장된 csv파일
        # 한글 정규화
        korean_pattern = r'[^ ?,.!A-Za-z0-9가-힣+]'
        self.normalizer = re.compile(korean_pattern)
        
        # src: 질의, itn: 의도 tgt: 답변
        src_clean = []
        itn_clean = [] 
        tgt_clean = []
        
        # 단어 사전 생성
        wordvocab = WordVocab()
        itn_label = {"검진" : 0, "식이, 생활" : 1, "약물" : 2, "예방" : 3, "운동" : 4, "원인" : 5, "정의" : 6, "증상" : 7, "진단" : 8, "치료" : 9}
        for _, row in df.iterrows():
            src = row['question']
            itn = row['intention']
            tgt = row['answer']
            
            # 한글 전처리
            src = self.clean_text(src)
            tgt = self.clean_text(tgt)
            
            if len(src.split()) > min_length and len(tgt.split()) > min_length:
                # 최소 길이를 넘어가는 문장의 단어만 추가
                wordvocab.add_sentence(src)
                wordvocab.add_sentence(tgt)
                src_clean.append(src)          
                tgt_clean.append(tgt)
            itn_clean.append(itn_label[itn])
        
        self.srcs = src_clean
        self.itns = itn_clean
        self.tgts = tgt_clean
        self.wordvocab = wordvocab
    
    def normalize(self, sentence):
        # 정규표현식에 따른 한글 정규화
        return self.normalizer.sub("", sentence)

    def clean_text(self, sentence):
        # 한글 정규화
        sentence = self.normalize(sentence)
        # 형태소 처리
        sentence = self.tagger.morphs(sentence)
        sentence = ' '.join(sentence)
        sentence = sentence.lower()
        return sentence
    
    def texts_to_sequences(self, sentence):
        # 문장 -> 시퀀스로 변환
        return [self.wordvocab.word2index[w] for w in mecab.morphs(sentence)]
    
        # return [self.wordvocab.word2index[w] for w in sentence.split()]

    def pad_sequence(self, sentence_tokens, max_length):
        # 문장의 맨 끝 토큰은 제거
        sentence_tokens = sentence_tokens[:(max_length-1)]
        token_length = len(sentence_tokens)

        # 문장의 맨 끝부분에 <EOS> 토큰 추가
        sentence_tokens.append(self.EOS_TOKEN)

        for i in range(token_length, (max_length-1)):
            # 나머지 빈 곳에 <PAD> 토큰 추가
            sentence_tokens.append(self.PAD_TOKEN)
        return sentence_tokens
    
    def __getitem__(self, idx):
        # 데이터프레임 구조
        #------------------------------------
        # 1 | 질문내용 | 의도 | 답변내용 
        # 2 | 질문내용 | 의도 | 답변내용 
        # ...
        # 마지막 idx | 질문내용 | 의도 | 답변내용 
        #-------------------------------------
        # 여기서 한줄씩 뽑아서 학습용 데이터셋을 구성
        # inputs = self.srcs[idx]
        
        # 입력형태 만들기
        inputs_sequences = self.texts_to_sequences(self.srcs[idx])
        inputs_padded = self.pad_sequence(inputs_sequences, self.q_max_length)
        
        # outputs = self.tgts[idx]
        # 출력 형태 만들기
        outputs = {}
        outputs_sequences = self.texts_to_sequences(self.tgts[idx])
        outputs_padded = self.pad_sequence(outputs_sequences, self.a_max_length)
        outputs['answer'] = torch.tensor(outputs_padded)
        outputs['intention'] = torch.tensor(self.itns[idx])
        
        return torch.tensor(inputs_padded), outputs
        # return torch.tensor(inputs_padded), torch.tensor(outputs_padded)
    
    def __len__(self):
        return len(self.srcs)


# In[49]:


# 한 문장의 최대 단어길이를 300로 설정
MAX_LENGTH = 300 # 안써도 되는 파라미터
Q_MAX_LENGTH = 30 # 질문 문장 최대 30개 토큰 사용
A_MAX_LENGTH = 350 # 답변 문장 최대 350개 토큰 사용

dataset = TextDataset('dementia_fix.csv', min_length=3, max_length1=MAX_LENGTH, q_max_length=Q_MAX_LENGTH, a_max_length=A_MAX_LENGTH)


# In[50]:


# 단어사전 등록된 단어 개수
dataset.wordvocab.n_words


# In[51]:


# 데이터셋으로 변환한 결과 확인
dataset[0]


# In[52]:


# 10번째 데이터 임의 추출
x, y = dataset[10]


# In[53]:


x


# In[54]:


print(f'x shape: {x.shape}')
print(x)

print(f'y shape: {y["answer"].shape}')
print(y)


# In[55]:


# 80%의 데이터를 train에 할당합니다.
train_size = int(len(dataset) * 0.8)
train_size


# In[56]:


# 나머지 20% 데이터를 test에 할당합니다.
test_size = len(dataset) - train_size
test_size


# In[57]:


from torch.utils.data import random_split

# 랜덤 스플릿으로 분할을 완료합니다.
train_dataset, test_dataset = random_split(dataset, [train_size, test_size])


# In[58]:


from torch.utils.data import DataLoader, SubsetRandomSampler

# 배치사이즈 : 16 (16개씩 묶음)
train_loader = DataLoader(train_dataset, 
                          batch_size=16, 
                          shuffle=True)

test_loader = DataLoader(test_dataset, 
                         batch_size=16, 
                         shuffle=True)


# In[59]:


train_dataset[0]


# In[60]:


# 1개의 배치 데이터를 추출합니다.
x, y = next(iter(train_loader))


# In[61]:


x, y


# In[62]:


# shape: (batch_size, sequence_length)
x.shape, y["answer"].shape


# ## 모델 만들기
#  - 기본적으로 seq-to-seq 는 encoder - decoder 구조로 되어있음
#  - 하나의 단어를 임베딩을 통해 벡터로 만들어줌
#  - 단어사전의 있는 모든 단어를 임베딩을 해줌
#  - 배치사이즈가 16개이므로, 질문입력 사이즈는(16x30), 답변 입력사이즈는(16x300)
#  - 여기에 임베딩 차원이 64이므로(단어 하나를 64개의 무언가로 표현) 각각 인코더를 통과하면 (16x30x64),(16x300x64)의 사이즈가 된다.
#  - gru의 히든 레이어 사이즈가 32이므로, 임베딩을 통과한 데이터가 64에서 32로 줄어듬 (16x30x32), (16x300x32)

# In[63]:


class Encoder(nn.Module):
    def __init__(self, num_vocabs, hidden_size, embedding_dim, num_layers):
        super(Encoder, self).__init__()
        
        # 단어 사전의 개수 지정
        self.num_vocabs = num_vocabs
        # 임베딩 레이어 정의 (number of vocabs, embedding dimension)
        self.embedding = nn.Embedding(num_vocabs, embedding_dim)
        # GRU (embedding dimension)
        self.gru = nn.GRU(embedding_dim, 
                          hidden_size, 
                          num_layers=num_layers, 
                          bidirectional=False)
        
    def forward(self, x):
        x = self.embedding(x).permute(1, 0, 2)
        output, hidden = self.gru(x)
        return output, hidden


# In[64]:


# Embedding Layer의 입/출력 shape에 대한 이해

embedding_dim = 64 # 임베딩 차원
embedding = nn.Embedding(dataset.wordvocab.n_words, embedding_dim)

# x의 shape을 변경합니다.
# (batch_size, sequence_length) => (sequence_length, batch_size)
embedded = embedding(x)

print(x.shape)
print(embedded.shape)
# input:  (sequence_length, batch_size)
# output: (sequence_length, batch_size, embedding_dim)


# In[65]:


embedded = embedded.permute(1, 0, 2)
print(embedded.shape)
# (sequence_length, batch_size, embedding_dim)


# In[66]:


hidden_size = 32   

gru = nn.GRU(embedding_dim,      # embedding 차원
             hidden_size, 
             num_layers=1, 
             bidirectional=False)

# input       : (sequence_length, batch_size, embedding_dim)
# h0          : (Bidirectional(1) x number of layers(1), batch_size, hidden_size)
o, h = gru(embedded, None)

print(o.shape)
print(h.shape)
# output      : (sequence_length, batch_size, hidden_size x bidirectional(1))
# hidden_state: (bidirectional(1) x number of layers(1), batch_size, hidden_size)


# In[67]:


NUM_VOCABS = dataset.wordvocab.n_words
print(f'number of vocabs: {NUM_VOCABS}')


# In[68]:


# Encoder 정의
encoder = Encoder(NUM_VOCABS, 
                  hidden_size=32, 
                  embedding_dim=64, 
                  num_layers=1)


# In[69]:


# Encoder에 x 통과 후 output, hidden_size 의 shape 확인
# input(x)    : (batch_size, sequence_length)
o, h = encoder(x)

print(o.shape)
print(h.shape)
# output      : (sequence_length, batch_size, hidden_size x bidirectional(1))
# hidden_state: (bidirectional(1) x number of layers(1), batch_size, hidden_size


# In[70]:


class Decoder(nn.Module):
    def __init__(self, num_vocabs, hidden_size, embedding_dim, num_layers=1, dropout=0.2):
        super(Decoder, self).__init__()
        # 단어사전 개수
        self.num_vocabs = num_vocabs
        self.embedding = nn.Embedding(num_vocabs, embedding_dim)
        self.dropout = nn.Dropout(dropout)
        self.gru = nn.GRU(embedding_dim, 
                          hidden_size, 
                          num_layers=num_layers, 
                          bidirectional=False)
        
        # 최종 출력은 단어사전의 개수
        self.fc = nn.Linear(hidden_size, num_vocabs)
        
    def forward(self, x, hidden_state):
        x = x.unsqueeze(0) # (1, batch_size) 로 변환
        embedded = F.relu(self.embedding(x))
        embedded = self.dropout(embedded)
        output, hidden = self.gru(embedded, hidden_state)
        output = self.fc(output.squeeze(0)) # (sequence_length, batch_size, hidden_size(32) x bidirectional(1))
        return output, hidden


# In[71]:


#Embedding Layer의 입/출력 shape
x = torch.abs(torch.randn(size=(1, 16)).long())
print(x)
x.shape
# batch_size = 16 이라 가정했을 때,
# (1, batch_size)
# 여기서 batch_size => (1, batch_size) 로 shape 변환을 선행


# In[72]:


embedding_dim = 64 # 임베딩 차원
embedding = nn.Embedding(dataset.wordvocab.n_words, embedding_dim)

embedded = embedding(x)
embedded.shape
# embedding 출력
# (1, batch_size, embedding_dim)


# In[73]:


#GRU Layer의 입/출력 shape에 대한 이해
hidden_size = 32

gru = nn.GRU(embedding_dim, 
            hidden_size, 
            num_layers=1, 
            bidirectional=False, 
            batch_first=False, # batch_first=False로 지정
           )

o, h = gru(embedded)

print(o.shape)
# output shape: (sequence_length, batch_size, hidden_size(32) x bidirectional(1))
print(h.shape)
# hidden_state shape: (Bidirectional(1) x number of layers(1), batch_size, hidden_size(32))


# In[74]:


# 최종 출력층(FC) shape에 대한 이해
fc = nn.Linear(32, NUM_VOCABS) # 출력은 단어사전의 개수로 가정

output = fc(o[0])

print(o[0].shape)
print(output.shape)
# input : (batch_size, output from GRU)
# output: (batch_size, output dimension)


# In[75]:


#인코더 -> 디코더 입출력 shape
decoder = Decoder(num_vocabs=dataset.wordvocab.n_words, 
                  hidden_size=32, 
                  embedding_dim=64, 
                  num_layers=1)


# In[76]:


x, y = next(iter(train_loader))

o, h = encoder(x)

print(o.shape, h.shape)
# output      : (batch_size, sequence_length, hidden_size(32) x bidirectional(1))
# hidden_state: (Bidirectional(1) x number of layers(1), batch_size, hidden_size(32))


# In[77]:


# ***************
x = torch.abs(torch.full(size=(16,), fill_value=SOS_TOKEN, dtype=torch.long))
print(x)
x.shape

# batch_size = 16 이라 가정(16개의 SOS 토큰)


# In[78]:


embedding_dim = 64 # 임베딩 차원
embedding = nn.Embedding(dataset.wordvocab.n_words, embedding_dim)

embedded = embedding(x)
embedded.shape
# embedding 출력
# (1, batch_size, embedding_dim)


# In[79]:


x


# In[80]:


decoder_output, decoder_hidden = decoder(x, h)
decoder_output.shape, decoder_hidden.shape
# (batch_size, num_vocabs), (1, batch_size, hidden_size)


# In[81]:


class Seq2Seq(nn.Module):
    def __init__(self, encoder, decoder, device):
        super(Seq2Seq, self).__init__()
        self.encoder = encoder
        self.decoder = decoder
        self.device = device
        
    def forward(self, inputs, outputs, teacher_forcing_ratio=0.5):
        # inputs : (batch_size, sequence_length)
        # outputs: (batch_size, sequence_length)
        
        batch_size, output_length = outputs.shape
        output_num_vocabs = self.decoder.num_vocabs
        
        # 리턴할 예측된 outputs를 저장할 임시 변수
        # (sequence_length, batch_size, num_vocabs)
        predicted_outputs = torch.zeros(output_length, batch_size, output_num_vocabs).to(self.device)
        
        # 인코더에 입력 데이터 주입, encoder_output은 버리고 hidden_state 만 살립니다. 
        # 여기서 hidden_state가 디코더에 주입할 context vector 입니다.
        # (Bidirectional(1) x number of layers(1), batch_size, hidden_size)
        _, decoder_hidden = self.encoder(inputs)
        
        # (batch_size) shape의 SOS TOKEN으로 채워진 디코더 입력 생성********************
        decoder_input = torch.full((batch_size,), SOS_TOKEN, dtype=torch.long, device=self.device)
        
        # 순회하면서 출력 단어를 생성합니다.
        # 0번째는 SOS TOKEN이 위치하므로, 1번째 인덱스부터 순회합니다.
        for t in range(0, output_length):
            # decoder_input : 디코더 입력 (batch_size) 형태의 SOS TOKEN로 채워진 입력
            # decoder_output: (batch_size, num_vocabs)
            # decoder_hidden: (Bidirectional(1) x number of layers(1), batch_size, hidden_size), context vector와 동일 shape
            decoder_output, decoder_hidden = self.decoder(decoder_input, decoder_hidden)

            # t번째 단어에 디코더의 output 저장
            predicted_outputs[t] = decoder_output
            
            # teacher forcing 적용 여부 확률로 결정
            # teacher forcing 이란: 정답치를 다음 RNN Cell의 입력으로 넣어주는 경우. 수렴속도가 빠를 수 있으나, 불안정할 수 있음
            teacher_force = random.random() < teacher_forcing_ratio
            
            # top1 단어 토큰 예측
            top1 = decoder_output.argmax(1) 
            
            # teacher forcing 인 경우 ground truth 값을, 그렇지 않은 경우, 예측 값을 다음 input으로 지정
            decoder_input = outputs[:, t] if teacher_force else top1
        
        return predicted_outputs.permute(1, 0, 2) # (batch_size, sequence_length, num_vocabs)로 변경


# In[82]:


#Seq2Seq 입출력 확인
# Encoder 정의
encoder = Encoder(num_vocabs=dataset.wordvocab.n_words, 
                       hidden_size=32, 
                       embedding_dim=64, 
                       num_layers=1)
# Decoder 정의
decoder = Decoder(num_vocabs=dataset.wordvocab.n_words, 
                       hidden_size=32, 
                       embedding_dim=64, 
                       num_layers=1)
# Seq2Seq 정의
seq2seq = Seq2Seq(encoder, decoder, 'cpu')


# In[83]:


x, y = next(iter(train_loader))
# print(x.shape, y.shape)
# (batch_size, sequence_length), (batch_size, sequence_length)


# In[84]:


x


# In[85]:


y


# In[86]:


import random
output = seq2seq(x, y['answer'])
# print(output.shape)
# (batch_size, sequence_length, num_vocabs)


# In[87]:


device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")

NUM_VOCABS = dataset.wordvocab.n_words
HIDDEN_SIZE = 512
EMBEDDIMG_DIM = 256

print(f'num_vocabs: {NUM_VOCABS}\n======================')

# Encoder 정의
encoder = Encoder(num_vocabs=NUM_VOCABS, 
                  hidden_size=HIDDEN_SIZE, 
                  embedding_dim=EMBEDDIMG_DIM, 
                  num_layers=1)
# Decoder 정의
decoder = Decoder(num_vocabs=NUM_VOCABS, 
                  hidden_size=HIDDEN_SIZE, 
                  embedding_dim=EMBEDDIMG_DIM, 
                  num_layers=1)

# Seq2Seq 생성
# encoder, decoder를 device 모두 지정
model = Seq2Seq(encoder.to(device), decoder.to(device), device)
print(model)


# In[88]:


encoder


# In[89]:


class EarlyStopping:
    def __init__(self, patience=3, delta=0.0, mode='min', verbose=True):
        """
        patience (int): loss or score가 개선된 후 기다리는 기간. default: 3
        delta  (float): 개선시 인정되는 최소 변화 수치. default: 0.0
        mode     (str): 개선시 최소/최대값 기준 선정('min' or 'max'). default: 'min'.
        verbose (bool): 메시지 출력. default: True
        """
        self.early_stop = False
        self.patience = patience
        self.verbose = verbose
        self.counter = 0
        
        self.best_score = np.inf if mode == 'min' else 0
        self.mode = mode
        self.delta = delta
        

    def __call__(self, score):

        if self.best_score is None:
            self.best_score = score
            self.counter = 0
        elif self.mode == 'min':
            if score < (self.best_score - self.delta):
                self.counter = 0
                self.best_score = score
                if self.verbose:
                    print(f'[EarlyStopping] (Update) Best Score: {self.best_score:.5f}')
            else:
                self.counter += 1
                if self.verbose:
                    print(f'[EarlyStopping] (Patience) {self.counter}/{self.patience}, ' \
                          f'Best: {self.best_score:.5f}' \
                          f', Current: {score:.5f}, Delta: {np.abs(self.best_score - score):.5f}')
                
        elif self.mode == 'max':
            if score > (self.best_score + self.delta):
                self.counter = 0
                self.best_score = score
                if self.verbose:
                    print(f'[EarlyStopping] (Update) Best Score: {self.best_score:.5f}')
            else:
                self.counter += 1
                if self.verbose:
                    print(f'[EarlyStopping] (Patience) {self.counter}/{self.patience}, ' \
                          f'Best: {self.best_score:.5f}' \
                          f', Current: {score:.5f}, Delta: {np.abs(self.best_score - score):.5f}')
                
            
        if self.counter >= self.patience:
            if self.verbose:
                print(f'[EarlyStop Triggered] Best Score: {self.best_score:.5f}')
            # Early Stop
            self.early_stop = True
        else:
            # Continue
            self.early_stop = False


# ## 학습 및 모델 튜닝
#  - 학습시키면서 성능 향상을 위해 하이퍼 파라미터 조정

# In[90]:


# 훈련에 적용할 하이퍼파라미터 설정

LR = 1e-3
optimizer = optim.Adam(model.parameters(), lr=LR)
loss_fn = nn.CrossEntropyLoss()

es = EarlyStopping(patience=5, 
                   delta=0.001, 
                   mode='min', 
                   verbose=True
                  )

scheduler = optim.lr_scheduler.ReduceLROnPlateau(optimizer, 
                                                 mode='min', 
                                                 factor=0.5, 
                                                 patience=2,
                                                 threshold_mode='abs',
                                                 min_lr=1e-8, 
                                                 verbose=True)


# In[91]:


# 훈련에 적용할 하이퍼파라미터 설정

LR = 5e-4
optimizer = optim.Adam(model.parameters(), lr=LR)
loss_fn = nn.CrossEntropyLoss(label_smoothing=0.1)

es = EarlyStopping(patience=7, 
                   delta=0.01, 
                   mode='min', 
                   verbose=True
                  )

scheduler = optim.lr_scheduler.ReduceLROnPlateau(optimizer, 
                                                 mode='min', 
                                                 factor=0.5, 
                                                 patience=3,
                                                 threshold_mode='abs',
                                                 min_lr=1e-8, 
                                                 verbose=True)


# In[92]:


# train 함수 정의
def train(model, data_loader, optimizer, loss_fn, device):
    model.train()
    running_loss = 0
    
    for x, y in data_loader:
        x, y = x.to(device), y['answer'].to(device) # tensor로만 학습이 되기때문에, 딕셔너리안에 있는 답변에 해당하는 값을 가져와야함
        # x, y['answer'], y['intention'] = x.to(device), y['answer'].to(device), y['intention'].to(device)

        optimizer.zero_grad() # 초기화
        
        # output: (batch_size, sequence_length, num_vocabs)
        output = model(x, y)
        output_dim = output.size(2)
        
        # 1번 index 부터 슬라이싱한 이유는 0번 index가 SOS TOKEN 이기 때문
        # (batch_size*sequence_length, num_vocabs) 로 변경
        output = output.reshape(-1, output_dim)
        
        # (batch_size*sequence_length) 로 변경
        y = y.view(-1)
        
        # Loss 계산
        loss = loss_fn(output, y)
        loss.backward()
        optimizer.step()
        
        running_loss += loss.item() * x.size(0)
        
    return running_loss / len(data_loader)


# In[93]:


# evaluation 함수 정의
def evaluate(model, data_loader, loss_fn, device):
    model.eval()
    
    eval_loss = 0
    
    with torch.no_grad():
        for x, y in data_loader:
            x, y = x.to(device), y['answer'].to(device)
            # x, y['answer'], y['intention'] = x.to(device), y['answer'].to(device), y['intention'].to(device)
            output = model(x, y)
            output_dim = output.size(2)
            output = output.reshape(-1, output_dim)
            y = y.view(-1)
            
            # Loss 계산
            loss = loss_fn(output, y)
            
            eval_loss += loss.item() * x.size(0)
            
    return eval_loss / len(data_loader)


# In[94]:


# 랜덤 샘플링 후 결과 추론
def sequence_to_sentence(sequences, index2word):
    outputs = []
    for p in sequences:

        word = index2word[p]
        if p not in [SOS_TOKEN, EOS_TOKEN, PAD_TOKEN]:
            outputs.append(word)
        if word == EOS_TOKEN:
            break
    return ' '.join(outputs)


# In[95]:


# sequence를 다시 문장으로 바꾸어 문장 형식으로 출력하기 위한 함수

def random_evaluation(model, dataset, index2word, device, n=10):
    
    n_samples = len(dataset)
    indices = list(range(n_samples))
    np.random.shuffle(indices)      # Shuffle
    sampled_indices = indices[:n]   # Sampling N indices
    
    # 샘플링한 데이터를 기반으로 DataLoader 생성
    sampler = SubsetRandomSampler(sampled_indices)
    sampled_dataloader = DataLoader(dataset, batch_size=10, sampler=sampler)
    
    model.eval()
    with torch.no_grad():
        for x, y in sampled_dataloader:
            x, y = x.to(device), y['answer'].to(device)      
            # x, y['answer'], y['intention'] = x.to(device), y['answer'].to(device), y['intention'].to(device)  
            output = model(x, y, teacher_forcing_ratio=0)
            # output: (number of samples, sequence_length, num_vocabs)
            
            preds = output.detach().cpu().numpy()
            x = x.detach().cpu().numpy()
            y = y.detach().cpu().numpy()
            
            for i in range(n):
                print(f'질문   : {sequence_to_sentence(x[i], index2word)}')
                print(f'답변   : {sequence_to_sentence(y[i], index2word)}')
                print(f'예측답변: {sequence_to_sentence(preds[i].argmax(1), index2word)}')
                print('==='*10)


# In[96]:


# 문장을 입력받아 답을 출력하는 함수

def predict(model, sentence, index2word, device, n=10):

    model.eval()
    with torch.no_grad():
        input_tokens = dataset.texts_to_sequences(dataset.clean_text(sentence))
        input_padded = dataset.pad_sequence(input_tokens, dataset.q_max_length)
    
        # 입력 데이터를 텐서로 변환
        input_tensor = torch.tensor(input_padded).unsqueeze(0).to(device)  # 배치 차원을 추가하고 텐서로 변환
        output_tensor =  torch.tensor([0 for i in range(350)]).unsqueeze(0).to(device)
        # x, y['answer'], y['intention'] = x.to(device), y['answer'].to(device), y['intention'].to(device)  
        output = model(input_tensor, output_tensor, teacher_forcing_ratio=0)
        # output: (number of samples, sequence_length, num_vocabs)
        
        # preds = output.detach().cpu().numpy()
        # x = x.detach().cpu().numpy()
        # y = y.detach().cpu().numpy()
        
        output_tokens = output.detach().squeeze(0).cpu().numpy()  # 배치 차원을 제거하고 넘파이 배열로 변환
        predicted_tokens = np.argmax(output_tokens, axis=1)  # 각 시퀀스의 최대 확률 토큰을 선택
        
        response_sentence = sequence_to_sentence(predicted_tokens, index2word)  # 토큰 시퀀스를 문자열로 변환
        
        return response_sentence


# In[97]:


# #  훈련 시작
# NUM_EPOCHS = 5
# STATEDICT_PATH = 'seq2seq-chatbot-kor.pt'

# best_loss = np.inf

# for epoch in range(NUM_EPOCHS):
#     loss = train(model, train_loader, optimizer, loss_fn, device)
    
#     val_loss = evaluate(model, test_loader, loss_fn, device)
     
#     if val_loss < best_loss:
#         best_loss = val_loss
#         torch.save(model.state_dict(), STATEDICT_PATH)
    
#     if epoch % 5 == 0:
#         print(f'epoch: {epoch+1}, loss: {loss:.4f}, val_loss: {val_loss:.4f}')
    
#     # Early Stop
#     es(loss)
#     if es.early_stop:
#         break
    
#     # Scheduler
#     scheduler.step(val_loss)
                   
# model.load_state_dict(torch.load(STATEDICT_PATH))
# torch.save(model.state_dict(), f'seq2seq-chatbot-kor-{best_loss:.4f}.pt')


# In[98]:


import pickle
with open('dict.pkl', 'rb') as f:
    dict1=pickle.load(f)
    dict2 = {v : k for k, v in dict1.items()}
dataset.wordvocab.word2index = dict1
dataset.wordvocab.index2word = dict2


# In[99]:


STATEDICT_PATH = 'seq2seq-chatbot-kor22.pt'
model.load_state_dict(torch.load(STATEDICT_PATH, map_location=device))
random_evaluation(model, test_dataset, dataset.wordvocab.index2word, device)


# In[100]:


import gradio as gr
import random
import time
def response(message, history, additional_input_info):
    # additional_input_info의 텍스트를 챗봇의 대답 뒤에 추가합니다.
    response = predict(model, message, dataset.wordvocab.index2word, device)
    return response
gr.ChatInterface(
        fn=response,
        textbox=gr.Textbox(placeholder="무엇이든 물어보세요", container=False, scale=7),
        title="치매박사🌞안깜빡이에요~",
        description="뇌신경질환(치매,알코올성치매,알츠하이머병,우을증)에 대해 무엇이든 물어보세요.",
        theme="soft",
        examples=[["치매가 의심될때는 어떤 전문의를 방문해야 하나요?"], ["알코올성 치매를 예방하는 가장 효과적인 방법은요?"], ["우울증 약물의 부작용은요?"]],
        retry_btn="다시보내기 ✈",
        undo_btn="이전챗 삭제 ✂",
        clear_btn="전챗 삭제 💥",
        additional_inputs=[
            gr.Textbox("!!!", label="끝말잇기")
        ]
).launch()


# In[ ]:





# In[ ]:




