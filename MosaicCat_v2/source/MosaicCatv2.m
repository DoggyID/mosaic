% 初期化
clear
clc

% 現在のスクリプトの親パスを取得
currentDir = fileparts(mfilename('fullpath'));
parentDir = fileparts(currentDir);

% 親パスのサブディレクトリを全て含むパスを追加する。
addpath(genpath(parentDir));



% モザイク定数の設定
mosrate = 400;

% 画像を取得
cat = imread('cat.jpg');
cat = im2double(cat);

% 画像行列catのサイズを取得
[rows, cols, ~] = size(cat); 

% 平均化後の画像を格納する行列を初期化
avg_cat = zeros(size(cat));

% 行方向のセグメント数
row_segs = ceil(rows / mosrate);

% 列方向のセグメント数
col_segs = ceil(cols / mosrate);

% 各セグメントを走査
for row_seg = 1:row_segs
   for col_seg = 1:col_segs
      % セグメントの開始行と終了行を計算
      start_row = (row_seg - 1) * mosrate + 1;
      end_row = min(row_seg * mosrate, rows); % 行末を超えないように調整

      % セグメントの開始列と終了列を計算
      start_col = (col_seg - 1) * mosrate + 1;
      end_col = min(col_seg * mosrate, cols); % 列末を超えないように調整

      % セグメントの平均値を計算
      segment = cat(start_row:end_row, start_col:end_col, :);
      avg_value = mean(segment, [1 2]); % 1次元と2次元方向で平均

      % 平均値をセグメント全体に代入
      avg_cat(start_row:end_row, start_col:end_col, :) = repmat(avg_value, [end_row-start_row+1, end_col-start_col+1, 1]); 
   end
end

imshow(avg_cat)