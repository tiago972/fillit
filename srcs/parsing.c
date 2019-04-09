#include "../libft/includes/libft.h"
#include "../includes/fillit.h"

int		ft_check_domino(char *buff)
{
	int		i;

	i = 0;
	while (i < BUFF_SIZE)
	{
		if (i % 5 == 4 && buff[i] != '\n')
			return (EXIT_FAILURE);
		if (buff[i] != '#' && buff[i] != '.' && i % 5 != 4 && i != 20)
			return (EXIT_FAILURE);
		i++;
	}
	return (EXIT_SUCCESS);
}

int		ft_create_domino(t_list **begin_list, char buff[BUFF_SIZE + 1])
{
	t_domino	v_domino;
	int			i;
	static int	rank = 0;
	t_list		*tmp;

	i = 0;
	ft_memset(&v_domino, 0, sizeof(t_domino));
	v_domino.rank = 'A';
	if (ft_check_domino(buff) == EXIT_FAILURE)
			return (EXIT_FAILURE);
	while (i < BUFF_SIZE)
	{
		if (buff[i] == '#')
		{
			v_domino.piece |= 1;
			v_domino.piece <<= 1;

		}
		else if (buff[i] == '.')
			v_domino.piece <<= 1;
		i++;
	}
	v_domino.rank = 'A' + rank;
	rank++;
	if (!(tmp = ft_lstnew(&v_domino, sizeof(t_domino))))
		return (EXIT_SUCCESS);
	ft_lstadd(begin_list, tmp);
	return (EXIT_SUCCESS);
}

int		ft_parse(const int fd)
{
	char	buff[BUFF_SIZE + 1];
	t_list	*begin_list;
	int		ret;

	begin_list = NULL;
	while ((ret = read(fd, buff, BUFF_SIZE)) > 0)
	{
		buff[ret] = '\0';
		if (ft_create_domino(&begin_list, buff) == EXIT_FAILURE)
		{
			ft_del_list(&begin_list);
			return (EXIT_FAILURE);
		}
	}
	if (ret > 545 || ret < 0)
	{
		ft_del_list(&begin_list);
		return (EXIT_FAILURE);
	}
	ft_print_board(&begin_list);
	ft_del_list(&begin_list);
	return (EXIT_SUCCESS);
}
