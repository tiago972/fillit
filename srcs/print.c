#include "../libft/includes/libft.h"
#include "../includes/fillit.h"

void	ft_print_board(t_list **begin_list)
{
	t_list		*tmp;
	t_domino	*v_domino;
	int			tmp_domino;
	int			i;

	tmp = *begin_list;
	while (tmp)
	{
		v_domino = ((t_domino *)tmp->content);
		if (!v_domino)
			break ;
		i = 1;
		while (i < 32)
		{
			tmp_domino = 1 << (i - 1);
			if (tmp_domino & v_domino->piece)
				ft_putchar(v_domino->rank);
			else
				ft_putchar('.');
			i++;
		}
		tmp = tmp->next;
		ft_putchar('\n');
	}
}

void	ft_del_list(t_list **begin_list)
{
	t_list		*tmp;
	t_domino	*del;
	t_list		*tmp2;

	tmp = *begin_list;
	while (tmp)
	{
		del = ((t_domino *)tmp->content);
		if (!del)
			return ;
		ft_memdel(&del);
		tmp2 = tmp->next;
		if (!tmp2)
			return ;
		ft_memdel(&tmp);
		tmp = tmp2;
	}
}
