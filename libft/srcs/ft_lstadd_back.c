#include "../includes/libft.h"

void	ft_lstadd_back(t_list **begin_list, t_list *elem)
{	
	t_list *last;

	last = *begin_list;
	if (!last)
	{
		*begin_list = elem;
		return ;
	}
	while (last->next)
		last = last->next;
	last->next = elem;
}
