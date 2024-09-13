#!/bin/sh
model_name=DLinear
for pred_len in 24
do
for seq_len in 48
do
  python -u run.py \
  --is_training 1 \
  --root_path ./data/dataset/ \
  --data_path traffic.csv \
  --model_id traffic_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features MS \
  --seq_len $seq_len \
  --pred_len $pred_len  \
  --enc_in 862 \
  --des 'Exp' \
  --itr 1 --batch_size 16 --learning_rate 0.05 >logs/$model_name'_'traffic_$seq_len'_'$pred_len.log
done
done
