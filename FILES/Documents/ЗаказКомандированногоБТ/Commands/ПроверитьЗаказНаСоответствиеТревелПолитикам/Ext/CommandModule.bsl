﻿
&НаСервере
Процедура ПроверитьЗаказНаСоответствиеТревелПолитикиНаСервере(ОбъектСсылка)
	Результат = УправлениеБТСервер.ПроверитьЗаказНаСоответствиеТревелПолитики(ОбъектСсылка);
	РС = РегистрыСведений.ПройденТревелПолитикой.СоздатьМенеджерЗаписи();
	РС.ОбъектПроверки = ОбъектСсылка;
	РС.Прочитать();
	РС.ОбъектПроверки = ОбъектСсылка;
	Если Результат.ПройденКонтроль Тогда
		РС.СтатусТревелПолитики = Перечисления.СтатусыТревелПолитики.ПройденКонтроль;
	Иначе
		ОписаниеОшибокПользователя = СтрСоединить(Результат.ОшибкиПользователя, Символы.ПС);
		РС.СтатусТревелПолитики = Перечисления.СтатусыТревелПолитики.НеПройденКонтроль;
		РС.ОписаниеОшибокТревелПолитики = УправлениеБТВызовСервера.ВJSON(Результат.Ошибки);
		РС.ПредставлениеОшибокДляПользователя = ОписаниеОшибокПользователя;
		Сообщить(ОписаниеОшибокПользователя);
	КонецЕсли;
	
	РС.Записать(Истина);
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	Если ТипЗнч(ПараметрКоманды) = Тип("Массив") Тогда	
		
		Для Каждого ОбъектСсылка ИЗ ПараметрКоманды Цикл
			Если ЗначениеЗаполнено(ОбъектСсылка)  Тогда  //Если ЗначениеЗаполнено(Объект.Ссылка)  Тогда
				ПроверитьЗаказНаСоответствиеТревелПолитикиНаСервере(ОбъектСсылка);
			Иначе
				Сообщить("Требуется предварительно сохранить документ!");
			КонецЕсли;
		КонецЦикла;
		
	КонецЕсли;
	
КонецПроцедуры
