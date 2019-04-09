#include "../libft/includes/libft.h"
#include <stdlib.h>

int		ft_print_usage(void)
{
	ft_putstr_err("usage: fillit  source_file\n");
	return (EXIT_FAILURE);
}

int		ft_error(void)
{
	ft_putstr("error\n");
	return (EXIT_FAILURE);
}
