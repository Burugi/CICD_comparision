#!/bin/sh
model_name=SegRNN
seq_len=48
pred_len=24

python -u run.py \
  --is_training 1 \
  --root_path ./data/dataset \
  --data_path traffic.csv \
  --model_id traffic_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features S \
  --seq_len $seq_len \
  --label_len 12 \
  --pred_len $pred_len \
  --seg_len 12 \
  --enc_in 1 \
  --d_model 512 \
  --dropout 0 \
  --learning_rate 0.001 \
  --des 'Exp' \
  --itr 1 \
  --train_epochs 100 >logs/$model_name'_S_traffic_'$seq_len'_'$pred_len.log

python -u run.py \
  --is_training 1 \
  --root_path ./data/dataset \
  --data_path traffic.csv \
  --model_id traffic_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features MS \
  --seq_len $seq_len \
  --label_len 12 \
  --pred_len $pred_len \
  --seg_len 12 \
  --enc_in 862 \
  --d_model 512 \
  --dropout 0 \
  --learning_rate 0.001 \
  --des 'Exp' \
  --itr 1 \
  --train_epochs 100 >logs/$model_name'_MS_traffic_'$seq_len'_'$pred_len.log
