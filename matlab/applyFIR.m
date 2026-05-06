% ## -*- texinfo -*-
% ## @deftypefn {} {@var{y} =} applyFIR (@var{h}, @var{x})
% ## Apply a FIR filter with coefficients @var{h} to the signal @var{x}
% ## @end deftypefn
% 
% ## Author: Isaac Hernandez <isaac@pop-os>
% ## Created: 2026-02-12

function y = applyFIR(h, x)
    y = filter(h, 1, x);
end