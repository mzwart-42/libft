#include "libft/ft_bool.h"

// NOTE: Does not detect errors
// TODO: add whitespace
double	 ft_atof(const char *str)
{
	double   result;
	double   scale;
	const int	neg = 1 - (2 * (*str == '-'));

	result = 0.0f;
	scale = 0.0f;
	if (*str == '-')
		++str;
	while (*str)
	{
		if (*str >= '0' && *str <= '9')
		{
			result = 10.0 * result + (float)(*str - '0');
			scale *= 10.0;
		}
		else if (*str == '.')
			scale = 1.0;
		else
			return (-1.0f);
		str++;
	}
	result *= neg;
	if (scale == 0.0)
		return (result);
	return (result / scale);
}
