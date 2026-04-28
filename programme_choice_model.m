clear;
clc;
close all;

programmes = {'Pure Sciences','Applied Sciences','Engineering','Accounting','Management','Arts'};
factors = {'Interest','Exam Results','Career','Location','Fees','Explore'};

% =========================
% STEP 1: INPUT WEIGHTS
% =========================
fprintf('\nEnter importance weights\n');

w = zeros(1,6);

for i = 1:6
    val = input([factors{i} ': ']);

    while val < 0
        fprintf('Enter positive values only\n');
        val = input([factors{i} ': ']);
    end

    w(i) = val;
end

% Normalize weights
w = w / sum(w);

fprintf('\nNormalized Weights:\n');
for i = 1:6
    fprintf('%s: %.3f\n', factors{i}, w(i));
end

% =========================
% STEP 2: INPUT RATINGS
% =========================
fprintf('\nEnter ratings for each programme (1 to 5)\n');

data = zeros(6,6);

for p = 1:6
    fprintf('\n%s\n', programmes{p});

    for f = 1:6
        val = input([factors{f} ': ']);

        while val < 1 || val > 5
            fprintf('Enter 1 to 5 only\n');
            val = input([factors{f} ': ']);
        end

        data(p,f) = val;
    end
end

% =========================
% STEP 3: UTILITY FUNCTION
% =========================
U = data * w';

% =========================
% STEP 4: MULTINOMIAL LOGIT MODEL
% =========================
expU = exp(U);
P = expU / sum(expU);

% =========================
% STEP 5: DISPLAY RESULTS
% =========================
fprintf('\n--- RESULTS ---\n');

for i = 1:6
    fprintf('%s -> Utility: %.3f | Probability: %.3f\n', programmes{i}, U(i), P(i));
end

[best_val, best_idx] = max(P);
fprintf('\nMOST LIKELY CHOICE: %s (%.3f)\n', programmes{best_idx}, best_val);

% =========================
% STEP 6: VISUALISATION
% =========================
figure;
bar(P);
set(gca, 'XTick', 1:6);
set(gca, 'XTickLabel', programmes);
xtickangle(30);
ylabel('Probability');
xlabel('Programme');
title('Programme Choice Probability using Multinomial Logit');
grid on;
