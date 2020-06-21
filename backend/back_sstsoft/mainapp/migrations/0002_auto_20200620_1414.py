# Generated by Django 3.0.7 on 2020-06-20 19:14

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='area',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='entityType',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=150)),
            ],
        ),
        migrations.CreateModel(
            name='eps',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='healthRegister',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('flu', models.BooleanField(default=False)),
                ('fever', models.BooleanField(default=False)),
                ('cough', models.BooleanField(default=False)),
                ('sore_throat', models.BooleanField(default=False)),
                ('nasal_congestion', models.BooleanField(default=False)),
                ('fatigue', models.BooleanField(default=False)),
                ('difficult_breathe', models.BooleanField(default=False)),
                ('muscle_pain', models.BooleanField(default=False)),
                ('diarrhea', models.BooleanField(default=False)),
                ('threw_up', models.BooleanField(default=False)),
                ('other', models.CharField(blank=True, max_length=1000, null=True)),
                ('temperature', models.DecimalField(decimal_places=2, default=0, max_digits=40)),
                ('photo_temperature', models.ImageField(blank=True, null=True, upload_to='health_register/')),
                ('photo_workspace', models.ImageField(blank=True, null=True, upload_to='health_register/')),
                ('photo_selfie', models.ImageField(blank=True, null=True, upload_to='health_register/')),
                ('observations', models.CharField(blank=True, max_length=2000, null=True)),
                ('health_condition', models.BooleanField(default=False)),
                ('medical_file', models.FileField(blank=True, null=True, upload_to='health_register/')),
                ('ill', models.BooleanField(default=False)),
                ('who_ill', models.CharField(blank=True, max_length=150, null=True)),
                ('home', models.BooleanField(default=False)),
                ('bad', models.BooleanField(default=False)),
                ('date', models.DateTimeField(auto_now_add=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='question',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('question', models.CharField(max_length=1000)),
                ('op1', models.CharField(max_length=1000)),
                ('op2', models.CharField(max_length=1000)),
                ('op3', models.CharField(max_length=1000)),
                ('answer', models.CharField(max_length=5)),
            ],
        ),
        migrations.CreateModel(
            name='resources',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('code', models.CharField(max_length=100)),
                ('image', models.ImageField(blank=True, null=True, upload_to='resources/')),
                ('resource_url', models.CharField(blank=True, max_length=150, null=True)),
                ('text', models.CharField(blank=True, max_length=1000, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='transport',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.RemoveField(
            model_name='user',
            name='identification',
        ),
        migrations.AddField(
            model_name='user',
            name='accept_terms',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='user',
            name='address',
            field=models.CharField(blank=True, max_length=150, null=True),
        ),
        migrations.AddField(
            model_name='user',
            name='boss',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='user',
            name='emergency_contact_name',
            field=models.CharField(blank=True, max_length=150, null=True),
        ),
        migrations.AddField(
            model_name='user',
            name='emergency_contact_phone',
            field=models.CharField(blank=True, max_length=150, null=True),
        ),
        migrations.AddField(
            model_name='user',
            name='emergency_contact_relationship',
            field=models.CharField(blank=True, max_length=150, null=True),
        ),
        migrations.AddField(
            model_name='user',
            name='health_system',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='user',
            name='is_sst',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='user',
            name='job',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='user',
            name='photo',
            field=models.ImageField(blank=True, null=True, upload_to='users/'),
        ),
        migrations.AddField(
            model_name='user',
            name='risk',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='user',
            name='who_health',
            field=models.CharField(blank=True, max_length=150, null=True),
        ),
        migrations.AddField(
            model_name='user',
            name='who_risk',
            field=models.CharField(blank=True, max_length=150, null=True),
        ),
        migrations.AlterField(
            model_name='user',
            name='birthday',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='user',
            name='id',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='user',
            name='username',
            field=models.CharField(blank=True, max_length=50, null=True, unique=True),
        ),
        migrations.CreateModel(
            name='schedule',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('date_start', models.DateTimeField(blank=True, null=True)),
                ('date_end', models.DateTimeField(blank=True, null=True)),
                ('schedule_fk_healthRegister', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='mainapp.healthRegister')),
            ],
        ),
        migrations.AddField(
            model_name='healthregister',
            name='user_fk_health',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.CreateModel(
            name='entity',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=150)),
                ('image', models.ImageField(blank=True, null=True, upload_to='resources/')),
                ('webpage', models.CharField(blank=True, max_length=150, null=True)),
                ('address', models.CharField(blank=True, max_length=150, null=True)),
                ('phone', models.CharField(blank=True, max_length=50, null=True)),
                ('entityType_fk_entity', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mainapp.entityType')),
            ],
        ),
        migrations.CreateModel(
            name='answers',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('user_answer', models.CharField(max_length=5)),
                ('date', models.DateTimeField(auto_now_add=True, null=True)),
                ('answer_fk_question', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='mainapp.question')),
                ('answer_fk_user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='user',
            name='area_fk_user',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='mainapp.area'),
        ),
        migrations.AddField(
            model_name='user',
            name='eps_fk_user',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='mainapp.eps'),
        ),
        migrations.AddField(
            model_name='user',
            name='transport_fk_user',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='mainapp.transport'),
        ),
    ]