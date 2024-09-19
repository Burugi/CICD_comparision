#!/bin/sh
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

for model_name in Autoformer Informer Transformer
do 

for pred_len in 24
do
for seq_len in 48
do  python -u run.py \
    --task_name long_term_forecast \
    --is_training 1 \
    --root_path ./data/dataset/ \
    --data_path Milano.csv \
    --features MS \
    --model_id Milano_$seq_len'_'$pred_len \
    --model $model_name \
    --data custom \
    --seq_len $seq_len \
    --label_len 12 \
    --pred_len $pred_len  \
    --e_layers 2 \
    --d_layers 1 \
    --factor 3 \
    --enc_in 5 \
    --dec_in 5 \
    --c_out 1 \
    --des 'Exp' \
    --itr 5 \
    --train_epochs 100 >logs/$model_name'_MS_Milano_'$seq_len'_'$pred_len.log
done
done
for pred_len in 24
do
for seq_len in 48
do  python -u run.py \
    --task_name long_term_forecast \
    --is_training 1 \
    --root_path ./data/dataset/ \
    --data_path Milano.csv \
    --features S \
    --model_id Milano_$features'_'$seq_len'_'$pred_len \
    --model $model_name \
    --data custom \
    --seq_len $seq_len \
    --label_len 12 \
    --pred_len $pred_len  \
    --e_layers 2 \
    --d_layers 1 \
    --factor 3 \
    --enc_in 1 \
    --dec_in 1 \
    --c_out 1 \
    --des 'Exp' \
    --itr 5 \
    --train_epochs 100 >logs/$model_name'_S_Milano_'$seq_len'_'$pred_len.log
done
done
done