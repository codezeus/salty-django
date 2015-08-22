"""
Development Settings
"""
from .base import *

DEBUG = True
TEMPLATE_DEBUG = True

APPS = (
    'django_extensions',
)

INSTALLED_APPS += APPS

INTERNAL_IPS = ('127.0.0.1',)

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    },
}

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
