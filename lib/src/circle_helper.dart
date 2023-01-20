// getStrokeSpace count the space between two bars
double getStrokeSpace(index, strokWidth, strokSpace) =>
    ((strokWidth + strokSpace) * index);

// getStrokeValue function return the bar value
double getStrokeValue(double value) => value / 100;
