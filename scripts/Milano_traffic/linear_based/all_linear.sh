#!/bin/sh
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

for model_name in DLinear NLinear Linear
do 
for seq_len in 48
do
for pred_len in 24
do python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./data/dataset/ \
  --data_path Milano.csv \
  --model_id Milano_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features MS \
  --seq_len $seq_len \
  --label_len 12 \
  --pred_len $pred_len  \
  --enc_in 5 \
  --des 'Exp' \
  --itr 10 \
  --train_epochs 100 \
  --batch_size 16 --learning_rate 0.05 >logs/$model_name'_MS_Milano_'$seq_len'_'$pred_len.log 
 
 python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./data/dataset/ \
  --data_path Milano.csv \
  --model_id Milano_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features S \
  --seq_len $seq_len \
  --label_len 12 \
  --pred_len $pred_len  \
  --enc_in 1 \
  --des 'Exp' \
  --itr 10 \
  --train_epochs 100 \
  --batch_size 16 --learning_rate 0.05 >logs/$model_name'_S_Milano_'$seq_len'_'$pred_len.log
done
done
done