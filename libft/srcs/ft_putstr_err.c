#include "../includes/libft.h"

void	ft_putstr_err(const char *str)
{
	char *cpy;

	if (!str)
		return ;
	cpy = (char*)str;
	while (*cpy)
	{
		ft_putchar_err(*cpy);
		cpy++;
	}
}
