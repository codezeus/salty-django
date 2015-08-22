"""
Base Settings
"""
import os
import sys

# DEFINE PATHS
PROJECT_DIR = os.path.dirname(__file__)
BASE_DIR = os.path.dirname(PROJECT_DIR)
REPO_DIR = os.path.dirname(BASE_DIR)

sys.path.insert(0, os.path.join(BASE_DIR, 'apps'))

# CORE SETTINGS
DEBUG = False
TEMPLATE_DEBUG = False
ALLOWED_HOSTS = ['*']
ROOT_URLCONF = 'urls'
WSGI_APPLICATION = 'project.wsgi.application'
AUTH_USER_MODEL = 'user_auth.Account'
LOGIN_URL = '/login/'
LOGIN_REDIRECT_URL = '/'

ADMINS = (
    ('Dan Sackett', 'danesackett@gmail.com'),
    ('Jesse Boyer', 'aniyishay@gmail.com'),
)

# APP DECLARATIONS
DJANGO_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
)

THIRD_PARTY_APPS = (
    'suit',
    'crispy_forms',
    'registration',
    'imagekit',
)

LOCAL_APPS = (
    'user_auth',
    'landings',
    'utils',
)

INSTALLED_APPS = DJANGO_APPS + THIRD_PARTY_APPS + LOCAL_APPS

# MIDDLEWARE
MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.security.SecurityMiddleware',
)

# INTERNATIONALIZATION
LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_L10N = True
USE_TZ = True

# STATIC AND MEDIA FILES
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'public'),
)

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

# TEMPLATES
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'django.core.context_processors.request',
            ],
        },
    },
]

# APP SPECFIC SETTINGS
CRISPY_TEMPLATE_PACK = 'bootstrap3'
ACCOUNT_ACTIVATION_DAYS = 7
