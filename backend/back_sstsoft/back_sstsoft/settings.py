"""
Django settings for back_sstsoft project.

Generated by 'django-admin startproject' using Django 3.0.6.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.0/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '9m=d#s$l4=xtu)4^5nouz5)h)i$kcj1$%#)m@cf85^u7p+mjjd'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'rest_framework.authtoken',
    'corsheaders',
    'mainapp',
    'django.contrib.postgres',
    'fcm_django',
    'django_filters',
]

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    # 'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'back_sstsoft.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'back_sstsoft.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases


DATABASES = {
    'default': {
        'NAME': 'sstsoft_db',
        'ENGINE': 'django.db.backends.postgresql',
        'USER': 'sstsoft_us',
        'PASSWORD': 'sstsoft2020',
        'PORT':'5432',
        'HOST':'localhost'
    }
}

# DATABASES = {
#     'default': {
#         'NAME': 'globhack_db',
# 		'ENGINE': 'django.contrib.gis.db.backends.postgis',
#         'USER': 'globhack_us',
#         'PASSWORD': 'globhack_pass',
#         'PORT':'5432',
#         'HOST':'localhost'
#     }
# }


# Password validation
# https://docs.djangoproject.com/en/3.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'America/Bogota'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/

# local conf
# static files configuration local
STATIC_URL = 'http://localhost/static_sstsoft/'
MEDIA_ROOT = '/Applications/XAMPP/xamppfiles/htdocs/static_sstsoft/media/'
MEDIA_URL = '/static_sstsoft/media/'
STATIC_ROOT = '/Applications/XAMPP/xamppfiles/htdocs/static_sstsoft'
STATICFILES_DIRS = (
    '/Applications/XAMPP/xamppfiles/htdocs/static_sstsoft/media/',
    '/Applications/XAMPP/xamppfiles/htdocs/static_sstsoft/media/users',
    '/Applications/XAMPP/xamppfiles/htdocs/static_sstsoft/media/health_register',
    '/Applications/XAMPP/xamppfiles/htdocs/static_sstsoft/media/resources',
)
# end static files configuration server

# server conf
# static files configuration server
# STATIC_URL = 'http://sstsoft.webfactional.com/static_sstsoft/'
# MEDIA_ROOT = '/home/sstsoft/webapps/static_sstsoft/media/'
# MEDIA_URL = '/static_sstsoft/media/'
# STATIC_ROOT = '/home/sstsoft/webapps/static_sstsoft'
# STATICFILES_DIRS = (
#     '/home/sstsoft/webapps/static_sstsoft/media/',
#     '/home/sstsoft/webapps/static_sstsoft/media/users',
#     '/home/sstsoft/webapps/static_sstsoft/media/health_register',
#     '/home/sstsoft/webapps/static_sstsoft/media/resources',
# )
# end static files configuration server

CORS_ORIGIN_ALLOW_ALL = True
AUTH_USER_MODEL = 'mainapp.User'

REST_FRAMEWORK = {
    # 'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.LimitOffsetPagination',
    'COERCE_DECIMAL_TO_STRING': False,
    'DEFAULT_PERMISSION_CLASSES': ('rest_framework.permissions.IsAuthenticated',),
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.TokenAuthentication',
    ),
    'EXCEPTION_HANDLER': 'rest_framework.views.exception_handler',
}

AUTHENTICATION_BACKENDS = ['django.contrib.auth.backends.AllowAllUsersModelBackend']