<%@ include file="/common/include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Add New Contact</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<!-- <script src="resources/scripts/js/countries.js"></script> -->



</head>
<body>

	<%@include file="../views/common/header_bar.jsp"%>


	<div class="main-content">
		<h1>Update Contact Information</h1>
		<form:form action="../person/edit/" method="post"
			modelAttribute="person">

			<div class="contentform">
				<div id="sendmessage">${error_response}</div>


				<div class="leftcontact">

					<div class="">
						<input type="hidden" name="id" id="id" data-rule="required"
							data-msg="V�rifiez votre saisie sur les champs : Le champ 'Pr�nom' doit �tre renseign�."
							value="${person.id}" />
					</div>
					<div class="form-group">
						<p>
							First Name<span>*</span>
						</p>
						<span class="icon-case"><i class="fa fa-male"></i></span> <input
							type="text" name="firstName" id=""
							firstName"" data-rule="required"
							data-msg="V�rifiez votre saisie sur les champs : Le champ 'Nom' doit �tre renseign�."
							value="${person.firstName}" />
						<div class="validation"></div>
					</div>

					<div class="form-group">
						<p>
							Last Name <span>*</span>
						</p>
						<span class="icon-case"><i class="fa fa-user"></i></span> <input
							type="text" name="lastName" id="lastName" data-rule="required"
							data-msg="V�rifiez votre saisie sur les champs : Le champ 'Pr�nom' doit �tre renseign�."
							value="${person.lastName}" />
						<div class="validation"></div>
					</div>

					<div class="form-group">
						<p>
							E-mail <span>*</span>
						</p>
						<span class="icon-case"><i class="fa fa-envelope-o"></i></span> <input
							type="email" name="pEmailId" id="pEmailId" data-rule="email"
							data-msg="V�rifiez votre saisie sur les champs : Le champ 'E-mail' est obligatoire."
							value="${person.pEmailId}" />
						<div class="validation"></div>
					</div>

					<div class="form-group">
						<p>
							Company <span>*</span>
						</p>
						<span class="icon-case"><i class="fa fa-home"></i></span> <input
							type="text" name="company" id="company" data-rule="required"
							data-msg="V�rifiez votre saisie sur les champs : Le champ 'Soci�t�' doit �tre renseign�."
							value="${person.company}" />
						<div class="validation"></div>
					</div>

					<div class="form-group">
						<p>
							Job Title <span>*</span>
						</p>
						<span class="icon-case"><i class="fa fa-location-arrow"></i></span>
						<input type="text" name="title" id="title" data-rule="required"
							data-msg="V�rifiez votre saisie sur les champs : Le champ 'Adresse' doit �tre renseign�."
							value="${person.title}" />
						<div class="validation"></div>
					</div>

					<div class="form-group">
						<p>
							Country <span>*</span>
						</p>
						<span class="icon-case"><i class="fa fa-map-marker"></i></span> <input
							type="text" name="country" id="country" data-rule="required"
							data-msg="V�rifiez votre saisie sur les champs : Le champ 'Code postal' doit �tre renseign�."
							value="${person.country}" />
						<div class="validation"></div>
					</div>



				</div>

				<div class="rightcontact">

					<div class="form-group">
						<p>
							City <span>*</span>
						</p>
						<span class="icon-case"><i class="fa fa-building-o"></i></span> <input
							type="text" name="city" id="city" data-rule="required"
							data-msg="V�rifiez votre saisie sur les champs : Le champ 'Ville' doit �tre renseign�."
							value="${person.city}" />
						<div class="validation"></div>
					</div>

					<div class="form-group">
						<p>
							Phone number <span>*</span>
						</p>
						<span class="icon-case"><i class="fa fa-phone"></i></span> <input
							type="text" name="mobileNo" id="mobileNo" data-rule="maxlen:10"
							data-msg="V�rifiez votre saisie sur les champs : Le champ 'T�l�phone' doit �tre renseign�. Minimum 10 chiffres"
							value="${person.mobileNo}" />


						<div class="validation"></div>
					</div>

					<div class="form-group">
						<p>
							LinkedIn Profile <span>*</span>
						</p>
						<span class="icon-case"><i class="fa fa-info"></i></span> <input
							type="text" name="profile" id="profile" data-rule="required"
							data-msg="V�rifiez votre saisie sur les champs : Le champ 'Fonction' doit �tre renseign�."
							value="${person.profile}" />
						<div class="validation"></div>
					</div>

					<div class="form-group">
						<p>
							Channel <span>*</span>
						</p>
						<span class="icon-case"><i class="fa fa-comment-o"></i></span> <input
							type="text" name="channel" id="channel" data-rule="required"
							data-msg="V�rifiez votre saisie sur les champs : Le champ 'Sujet' doit �tre renseign�."
							value="${person.channel}" />
						<div class="validation"></div>
					</div>

					<div class="form-group">
						<p>
							Comment <span>*</span>
						</p>
						<span class="icon-case"><i class="fa fa-comments-o"></i></span>
						<textarea name="comment" rows="14" data-rule="required"
							data-msg="V�rifiez votre saisie sur les champs : Le champ 'Message' doit �tre renseign�."
							value="${person.comment}"></textarea>
						<div class="validation"></div>
					</div>
				</div>
			</div>
			<button type="submit" class="bouton-contact">Update Contact</button>

		</form:form>
		<!-- /.container -->
	</div>
	<div id="footer">
		<br></br>
		<footer> <%@include file="./common/footer/footer.html"%>
		</footer>
	</div>


	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

	<script language="javascript">
		$(document).ready(
				function() {

					// Here is how to show an error message next to a form field

					var errorField = $('.form-input-name-row');

					// Adding the form-invalid-data class will show
					// the error message and the red x for that field

					errorField.addClass('form-invalid-data');
					errorField.find('.form-invalid-data-info').text(
							'Please enter your name');

					// Here is how to mark a field with a green check mark

					var successField = $('.form-input-email-row');

					successField.addClass('form-valid-data');
				});

		/* 	populateCountries("country", "state"); */
	</script>

</body>

</html>
