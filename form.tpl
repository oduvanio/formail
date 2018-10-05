{root:}
	<div class="formail">
		<h1>Подарок другу с сайта</h1>
		<p>Если вы являетесь <a href="/actions/club">членом клуба</a>, либо проходили лечение в нашей клинике, то можете сделать приятный подарок своему другу, родственнику, знакомому или просто хорошему человеку.</p><p> Для этого необходимо заполнить форму ниже. После заполнения формы, человек, которого вы указали в форме получит смс уведомление о скидке на лечение в клинике.</p>
		{config.ans?config.ans:ans.msg}
		<form action="/-formail/">
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="name">Ваше ФИО</label>
						<input class="form-control" type="text" name="name" required>
					</div>
					<div class="form-group">
						<label for="phone">Ваш телефон</label>
						<input class="form-control" type="tel" name="phone" required>
					</div>
					<div class="form-group">
						<label for="friend-name">ФИО друга</label>
						<input class="form-control" type="text" name="friend-name" id="friend-name" required>
					</div>
					 <div class="form-group">
						<label for="friend-phone">Телефон друга</label>
						<input class="form-control" type="tel" name="friend-phone" id="friend-phone" required>
					</div>
					<p>
						<div id="recaptcha{id}" class="g-recaptcha"  data-sitekey="{~conf.recaptcha.sitekey}"></div>
					</p>
					<div class="form-group">
						<input class="btn btn-success" type="submit">
					</div>
				</div>
				<div class="col-sm-6">
					<img class="img-fluid d-none d-sm-block" src="/data/images/discount.jpg">
				</div>
			</div>
		</form>
		<script>
			domready(function () {
				Event.one('reCAPTCHA', function (){
					grecaptcha.render('recaptcha{id}');
				});
			});
		</script>
	</div>
	{config.ans?config.ans:ans.msg}
{ans::}-ans/ans.tpl