# Generated by Django 3.0.6 on 2020-05-31 07:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0016_auto_20200530_2326'),
    ]

    operations = [
        migrations.AddField(
            model_name='entity',
            name='entityType_fk_entity',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='mainapp.entityType'),
            preserve_default=False,
        ),
    ]
