{root:}
	<h1>Форма</h1>
	<form action="/-formail/">
		<input name="name">
		<input name="sername">
		<input name="email">
		<input name="friend-name">
		<input name="friend-phone">
		<input type="submit">
	</form>
	{config.ans?config.ans:msg}
{msg:}
	{result?:good?:bad}
	{msg}
	{good:}
		Всё ок!
	{bad:}
		Всё не ок!