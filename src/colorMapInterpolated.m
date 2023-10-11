function InterpolatedColorMap = colorMapInterpolated(size)
    V = colormap('jet');
    n = length(V);
    X = 1:1:n;
    X = X / n;
    Xq = 1:1:size;
    Xq = Xq / size;
    InterpolatedColorMap = interp1(X, V, Xq);
end
