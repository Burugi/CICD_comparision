import torch

# GPU 사용 가능 여부 확인
if torch.cuda.is_available():
    print("GPU 사용 가능")
else:
    print("GPU 사용 불가능")

# 사용 가능한 GPU의 개수
gpu_count = torch.cuda.device_count()
print(f"사용 가능한 GPU 개수: {gpu_count}")


if torch.cuda.is_available():
    for i in range(torch.cuda.device_count()):
        print(f"GPU {i} - 이름: {torch.cuda.get_device_name(i)}")
else:
    print("GPU 사용 불가능")
    
# 현재 기본 device 확인
current_device = torch.cuda.current_device()
print(f"현재 사용 중인 GPU 번호: {current_device}")
print(f"현재 사용 중인 GPU 이름: {torch.cuda.get_device_name(current_device)}")