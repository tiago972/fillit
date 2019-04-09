#include "../libft/includes/libft.h"

void	ft_print_bits(unsigned int n) 
{ 
	unsigned int i; 

	i = (1 << 31);
	while (i > 0)
	{
		if (n & i)
			ft_putchar('1');
		else
			ft_putchar('0');
		i /= 2;
	}
}
