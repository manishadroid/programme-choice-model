# Programme Choice Model (Octave)

This project simulates Aiman’s undergraduate programme selection using a discrete choice model.

## Description
The model uses six factors:
- Interest
- Exam Results
- Career
- Location
- Fees
- Explore

Each factor is assigned a weight. The programme ratings are entered from 1 to 5.

The model calculates:
- Utility values (U)
- Probabilities using Multinomial Logit model (P)

The programme with the highest probability is selected as the most likely choice.

## Tool Used
GNU Octave

## How to Run
1. Open GNU Octave
2. Open the file `programme_choice_model.m`
3. Click Run
4. Enter weights and ratings
5. View results in Command Window and graph output

## Output
The system displays:
- Utility values
- Probability for each programme
- Most likely programme choice
- Bar chart visualisation
