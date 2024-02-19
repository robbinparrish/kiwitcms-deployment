# https://kiwitcms.readthedocs.io/en/latest/configuration.html
# https://docs.djangoproject.com/en/

# Email settings.
# DEFAULT_FROM_EMAIL = "kiwitcms@kiwitcms.mydomain.com"
# SERVER_EMAIL = DEFAULT_FROM_EMAIL = "kiwitcms@kiwitcms.mydomain.com"
# EMAIL_SUBJECT_PREFIX = "[Kiwi-TCMS]"
# EMAIL_HOST = "smtp.mydomain.com"
# EMAIL_PORT = 587
# EMAIL_HOST_USER = "kiwitcms@kiwitcms.mydomain.com"
# EMAIL_HOST_PASSWORD = "SMTP_PASSWORD"
# EMAIL_USE_TLS = "True"

# Account creation settings.
AUTO_APPROVE_NEW_USERS = False
REGISTRATION_ENABLED = False

# Max file upload size. (size in bytes - 50MB)
FILE_UPLOAD_MAX_SIZE = "52428800"

# Enable OAuth using GitLab - Not Tested.
# https://python-social-auth.readthedocs.io/en/latest/configuration/django.html
# AUTHENTICATION_BACKENDS = [
#    "django.contrib.auth.backends.ModelBackend",
#    "guardian.backends.ObjectPermissionBackend",
#    "social_core.backends.gitlab.GitLabOAuth2",
#]
#SOCIAL_AUTH_GITLAB_SCOPE = ['read_user']
#SOCIAL_AUTH_GITLAB_KEY = ""
#SOCIAL_AUTH_GITLAB_SECRET = ""
#SOCIAL_AUTH_GITLAB_API_URL = ""

