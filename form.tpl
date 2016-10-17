{root:}
	<style>
		.field {
			clear: both;
			text-align: right;
		}
		form[action="/-formail/"] label {
			margin-top: 5px;
			float: left;
			padding-right: 20px;
		}
		.main {
			float: left;
		}
		form[action="/-formail/"] input:valid {
			background: rgba(0, 255, 0, 0.3);
		}
		form[action="/-formail/"] input:invalid {
			background: rgba(255, 0, 0, 0.2);
		}
		form[action="/-formail/"] input[type="submit"] {
			margin-top: 10px;
			float: right;
			background: none;
		}
	</style>
	<h1>Подарок другу с сайта</h1>
	<p>Если вы являетесь членом клуба, либо проходили лечение в нашей клинике, то можете сделать приятный подарок своему другу, родственнику, знакомому или просто хорошему человеку.<br>Для этого необходимо заполнить форму ниже с указанием обязательных полей, отмеченных красным цветом.<br>После заполнения формы, человек, которого вы указали в форме получит смс уведомление о скидке на лечение в нашей клинике.</p>
	<form action="/-formail/">
		<div class="main">
			<div class="field">
				<label for="name">Ваше имя:</label>
				<input type="text" name="name" required>
			</div>
			<div class="field">
				<label for="sername">Ваша фамилия:</label>
				<input type="text" name="sername" required>
			</div>
			<div class="field">
				<label for="email">Ваша почта:</label>
				<input type="email" name="email" required>
			</div>
			<div class="field">
				<label for="friend-name">Имя друга:</label>
				<input type="text" name="friend-name" required>
			</div>
			<div class="field">
				<label for="friend-phone">Телефон друга:</label>
				<input type="tel" name="friend-phone" required>
			</div>
			<input type="submit">
		</div>
	</form>
	<img src="/data/images/discount.jpg" style="float: right; width: 40%;">
	{config.ans?config.ans:msg}
{msg:}
	{result?:good?:bad}
	{msg}
	{good:}
		Всё ок!
	{bad:}
		Всё не ок!
