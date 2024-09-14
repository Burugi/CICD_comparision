# ARIMA and SARIMA is extremely slow, you might need to sample 1% data (add --sample 0.01)
# Naive is the Closest Repeat (Repeat-C). It repeats the last value in the look back window.

# SARIMA 는 너무 오래 걸려서 제외
for model_name in Naive GBRT ARIMA
  do
  for pred_len in 48
    do
    python -u run_stat.py \
      --is_training 1 \
      --root_path ./dataset/ \
      --data_path traffic.csv \
      --model_id traffic_$seq_len'_'$pred_len \
      --model $model_name \
      --data custom \
      --seq_len 24 \
      --label_len 12 \
      --pred_len $pred_len \
      --des 'Exp' \
      --itr 1 >logs/$model_name'_traffic_'$pred_len.log
  done
done
