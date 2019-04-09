#ifndef FILLIT_H
# define FILLIT_H

# include "../libft/includes/libft.h"
# include <stdio.h>
# define BUFF_SIZE 21

typedef struct s_domino
{
	int		piece;
	size_t	width;
	size_t	height;
	char	rank;
}			t_domino;

int		ft_print_usage(void);
int		ft_error(void);
int		ft_parse(const int);
int		ft_create_domino(t_list **begin_list, char buff[BUFF_SIZE + 1]);
void	ft_print_board(t_list **begin_list);
void	ft_print_bits(unsigned int n);
int		ft_reverse_bits(unsigned int n);
void	ft_del_list(t_list **begin_list);
int		ft_check_domino(char *buff);

#endif
