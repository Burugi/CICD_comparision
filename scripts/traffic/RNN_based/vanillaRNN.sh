#!/bin/sh
model_name=VanillaRNN

for seq_len in 48
do
for pred_len in 24
do python -u run.py \
  --task_name long_term_forecast \
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
  --d_model 256 \
  --dropout 0 \
  --learning_rate 0.001 \
  --rnn_type rnn \
  --des 'Exp' \
  --itr 10 \
  --train_epochs 100 >logs/$model_name'_S_traffic_'$seq_len'_'$pred_len.log

python -u run.py \
  --task_name long_term_forecast \
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
  --d_model 256 \
  --dropout 0 \
  --learning_rate 0.001 \
  --rnn_type rnn \
  --des 'Exp' \
  --itr 10 \
  --train_epochs 100 >logs/$model_name'_MS_traffic_'$seq_len'_'$pred_len.log
done
done