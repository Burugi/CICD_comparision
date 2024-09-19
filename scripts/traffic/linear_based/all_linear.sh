#!/bin/sh
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

for model_name in DLinear NLinear Linear
do 
for pred_len in 24
do
for seq_len in 48
do python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./data/dataset/ \
  --data_path traffic.csv \
  --model_id traffic_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features MS \
  --seq_len $seq_len \
  --label_len 12 \
  --pred_len $pred_len  \
  --enc_in 862 \
  --des 'Exp' \
  --itr 5 \
  --train_epochs 100 \
  --batch_size 16 --learning_rate 0.05 >logs/$model_name'_MS_traffic_'$seq_len'_'$pred_len.log 
done
done

for pred_len in 24
do
for seq_len in 48
do python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./data/dataset/ \
  --data_path traffic.csv \
  --model_id traffic_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features S \
  --seq_len $seq_len \
  --label_len 12 \
  --pred_len $pred_len  \
  --enc_in 1 \
  --des 'Exp' \
  --itr 5 \
  --train_epochs 100 \
  --batch_size 16 --learning_rate 0.05 >logs/$model_name'_S_traffic_'$seq_len'_'$pred_len.log 
done
done
done