﻿
#Область ТиповойФункционал

&НаКлиенте
Процедура Подключаемый_ВыполнитьКомандуПечати(Команда)
	
	УправляемыеФормыКлиент.УПВыполнитьПодключаемуюКомандуПечати(Команда, ЭтаФорма, Элементы.Список);
	
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ВыполнитьПереопределяемуюКоманду(Команда)
	
	УправляемыеФормыКлиент.СФКВыполнитьПереопределяемуюКоманду(ЭтаФорма, Команда);
	
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ВыполнитьКомандуСоздатьНаОсновании(Команда)
	
	УправляемыеФормыКлиент.ВНОКВыполнитьПодключаемуюКомандуСоздатьНаОсновании(Команда, ЭтаФорма, Элементы.Список);
	
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ВыполнитьКомандуОтчет(Команда)
	
	УправляемыеФормыКлиент.МОКВыполнитьПодключаемуюКомандуОтчет(Команда, ЭтаФорма, Элементы.Список);
	
КонецПроцедуры

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
	УправляемыеФормыКлиент.ВыполнитьКоманду(ЭтотОбъект, Команда, Элементы.Список);
КонецПроцедуры

&НаСервере
Процедура Подключаемый_ВыполнитьКомандуНаСервере(Контекст, Результат)
	УправляемыеФормыСервер.ВыполнитьКоманду(ЭтотОбъект, Контекст, Элементы.Список, Результат);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
	УправляемыеФормыКлиент.ОбновитьКоманды(ЭтотОбъект, Элементы.Список);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти



#Область Действия

&НаКлиенте
Процедура ДействиеПриИзменении(Элемент)
	УправляемыеФормыКлиент.ДействиеПриИзменении(ЭтаФорма, Элемент, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПриИзменении(ЭтаФорма, Элемент, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ДействиеНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ДействиеНачалоВыбора(ЭтаФорма, Элемент, ДанныеВыбора, СтандартнаяОбработка, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеНачалоВыбора(ЭтаФорма, Элемент, ДанныеВыбора, СтандартнаяОбработка, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ДействиеНачалоВыбораИзСписка(Элемент, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ДействиеНачалоВыбораИзСписка(ЭтаФорма, Элемент, СтандартнаяОбработка, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеНачалоВыбораИзСписка(ЭтаФорма, Элемент, СтандартнаяОбработка, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ДействиеОчистка(Элемент, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ДействиеОчистка(ЭтаФорма, Элемент, СтандартнаяОбработка, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеОчистка(ЭтаФорма, Элемент, СтандартнаяОбработка, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ДействиеРегулирование(Элемент, Направление, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ДействиеРегулирование(ЭтаФорма, Элемент, Направление, СтандартнаяОбработка, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеРегулирование(ЭтаФорма, Элемент, Направление, СтандартнаяОбработка, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ДействиеОткрытие(Элемент, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ДействиеОткрытие(ЭтаФорма, Элемент, СтандартнаяОбработка, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеОткрытие(ЭтаФорма, Элемент, СтандартнаяОбработка, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ДействиеСоздание(Элемент, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ДействиеСоздание(ЭтаФорма, Элемент, СтандартнаяОбработка, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеСоздание(ЭтаФорма, Элемент, СтандартнаяОбработка, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ДействиеОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ДействиеОбработкаВыбора(ЭтаФорма, Элемент, ВыбранноеЗначение, СтандартнаяОбработка, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеОбработкаВыбора(ЭтаФорма, Элемент, ВыбранноеЗначение, СтандартнаяОбработка, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ДействиеИзменениеТекстаРедактирования(Элемент, Текст, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ДействиеИзменениеТекстаРедактирования(ЭтаФорма, Элемент, Текст, СтандартнаяОбработка, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеИзменениеТекстаРедактирования(ЭтаФорма, Элемент, Текст, СтандартнаяОбработка, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ДействиеАвтоПодбор(Элемент, Текст, ДанныеВыбора, ПараметрыПолученияДанных, Ожидание, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ДействиеАвтоПодбор(ЭтаФорма, Элемент, Текст, ДанныеВыбора, ПараметрыПолученияДанных, Ожидание, СтандартнаяОбработка, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеАвтоПодбор(ЭтаФорма, Элемент, Текст, ДанныеВыбора, ПараметрыПолученияДанных, Ожидание, СтандартнаяОбработка, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ДействиеОкончаниеВводаТекста(Элемент, Текст, ДанныеВыбора, ПараметрыПолученияДанных, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ДействиеОкончаниеВводаТекста(ЭтаФорма, Элемент, Текст, ДанныеВыбора, ПараметрыПолученияДанных, СтандартнаяОбработка, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеОкончаниеВводаТекста(ЭтаФорма, Элемент, Текст, ДанныеВыбора, ПараметрыПолученияДанных, СтандартнаяОбработка, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПриАктивизацииСтроки(Элемент)
	УправляемыеФормыКлиент.ДействиеПриАктивизацииСтроки(ЭтаФорма, Элемент, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПриАктивизацииСтроки(ЭтаФорма, Элемент, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеВыборЗначения(Элемент, Значение, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ДействиеВыборЗначения(ЭтаФорма, Элемент, СтандартнаяОбработка, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеВыборЗначения(ЭтаФорма, Элемент, СтандартнаяОбработка, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПриАктивизацииПоля(Элемент)
	УправляемыеФормыКлиент.ДействиеПриАктивизацииПоля(ЭтаФорма, Элемент, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПриАктивизацииПоля(ЭтаФорма, Элемент, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПриАктивизацииЯчейки(Элемент)
	УправляемыеФормыКлиент.ДействиеПриАктивизацииЯчейки(ЭтаФорма, Элемент, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПриАктивизацииЯчейки(ЭтаФорма, Элемент, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПередНачаломДобавления(Элемент, Отказ, Копирование, Родитель, Группа, Параметр)
	УправляемыеФормыКлиент.ДействиеПередНачаломДобавления(ЭтаФорма, Элемент, Отказ, Копирование, Родитель, Группа, Параметр, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПередНачаломДобавления(ЭтаФорма, Элемент, Отказ, Копирование, Родитель, Группа, Параметр, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПередНачаломИзменения(Элемент, Отказ)
	УправляемыеФормыКлиент.ДействиеПередНачаломИзменения(ЭтаФорма, Элемент, Отказ, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПередНачаломИзменения(ЭтаФорма, Элемент, Отказ, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПередУдалением(Элемент, Отказ)
	УправляемыеФормыКлиент.ДействиеПередУдалением(ЭтаФорма, Элемент, Отказ, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПередУдалением(ЭтаФорма, Элемент, Отказ, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПриНачалеРедактирования(Элемент, НоваяСтрока, Копирование)
	УправляемыеФормыКлиент.ДействиеПриНачалеРедактирования(ЭтаФорма, Элемент, НоваяСтрока, Копирование, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПриНачалеРедактирования(ЭтаФорма, Элемент, НоваяСтрока, Копирование, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПередОкончаниемРедактирования(Элемент, НоваяСтрока, ОтменаРедактирования, Отказ)
	УправляемыеФормыКлиент.Действие(ЭтаФорма, Элемент, НоваяСтрока, ОтменаРедактирования, Отказ, "Начало");	
	//	
	УправляемыеФормыКлиент.Действие(ЭтаФорма, Элемент, НоваяСтрока, ОтменаРедактирования, Отказ, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПриОкончанииРедактирования(Элемент, НоваяСтрока, ОтменаРедактирования)
	УправляемыеФормыКлиент.ДействиеПриОкончанииРедактирования(ЭтаФорма, Элемент, НоваяСтрока, ОтменаРедактирования, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПриОкончанииРедактирования(ЭтаФорма, Элемент, НоваяСтрока, ОтменаРедактирования, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПередРазворачиванием(Элемент, Строка, Отказ)
	УправляемыеФормыКлиент.ДействиеПередРазворачиванием(ЭтаФорма, Элемент, Строка, Отказ, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПередРазворачиванием(ЭтаФорма, Элемент, Строка, Отказ, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПередСворачиванием(Элемент, Строка, Отказ)
	УправляемыеФормыКлиент.ДействиеПередСворачиванием(ЭтаФорма, Элемент, Строка, Отказ, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПередСворачиванием(ЭтаФорма, Элемент, Строка, Отказ, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПослеУдаления(Элемент)
	УправляемыеФормыКлиент.ДействиеПослеУдаления(ЭтаФорма, Элемент, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПослеУдаления(ЭтаФорма, Элемент, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПриСменеТекущегоРодителя(Элемент)
	УправляемыеФормыКлиент.ДействиеПриСменеТекущегоРодителя(ЭтаФорма, Элемент, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПриСменеТекущегоРодителя(ЭтаФорма, Элемент, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеОбработкаЗаписиНового(НовыйОбъект, Источник, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ДействиеОбработкаЗаписиНового(ЭтаФорма, НовыйОбъект, Источник, СтандартнаяОбработка, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеОбработкаЗаписиНового(ЭтаФорма, НовыйОбъект, Источник, СтандартнаяОбработка, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеНачалоПеретаскивания(Элемент, ПараметрыПеретаскивания, Выполнение)
	УправляемыеФормыКлиент.ДействиеНачалоПеретаскивания(ЭтаФорма, Элемент, ПараметрыПеретаскивания, Выполнение, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеНачалоПеретаскивания(ЭтаФорма, Элемент, ПараметрыПеретаскивания, Выполнение, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПроверкаПеретаскивания(Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка, Строка, Поле)
	УправляемыеФормыКлиент.ДействиеПроверкаПеретаскивания(ЭтаФорма, Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка, Строка, Поле, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПроверкаПеретаскивания(ЭтаФорма, Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка, Строка, Поле, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеОкончаниеПеретаскивания(Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ДействиеОкончаниеПеретаскивания(ЭтаФорма, Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеОкончаниеПеретаскивания(ЭтаФорма, Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ДействиеПеретаскивание(Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка, Строка, Поле)
	УправляемыеФормыКлиент.ДействиеПеретаскивание(ЭтаФорма, Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка, Строка, Поле, "Начало");	
	//	
	УправляемыеФормыКлиент.ДействиеПеретаскивание(ЭтаФорма, Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка, Строка, Поле, "Конец");	
КонецПроцедуры

#КонецОбласти


// СЕРВЕР

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	УправляемыеФормыСервер.ПриСозданииНаСервере(ЭтаФорма, Отказ, СтандартнаяОбработка, "Начало");
	
	Если НЕ УправляемыеФормыСервер.ПриСозданииНаСервере(ЭтаФорма, Отказ, СтандартнаяОбработка, "Вместо") Тогда
		// Обработчик подсистемы "Внешние обработки"
		УправляемыеФормыСервер.ПриСозданииНаСервереФорма("ДополнительныеОтчетыИОбработки", ЭтаФорма);
		УправляемыеФормыСервер.ПриСозданииНаСервереПодменю("УправлениеПечатью", ЭтаФорма, Элементы.ПодменюПечать);
		УправляемыеФормыСервер.ПриСозданииНаСервереПодменю("ВводНаОсновании", ЭтаФорма, Элементы.ПодменюСоздатьНаОсновании);
		УправляемыеФормыСервер.ПриСозданииНаСервереПодменю("МенюОтчеты", ЭтаФорма, Элементы.ПодменюОтчеты);
		//Конец типового функционала
	КонецЕсли;
	
	УправляемыеФормыСервер.ПриСозданииНаСервере(ЭтаФорма, Отказ, СтандартнаяОбработка, "Конец");
	
КонецПроцедуры

&НаСервере
Процедура ОбработкаПроверкиЗаполненияНаСервере(Отказ, ПроверяемыеРеквизиты)
	УправляемыеФормыСервер.ОбработкаПроверкиЗаполненияНаСервере(ЭтаФорма, Отказ, ПроверяемыеРеквизиты, "Начало");
	//Вставить содержимое обработчика
	УправляемыеФормыСервер.ОбработкаПроверкиЗаполненияНаСервере(ЭтаФорма, Отказ, ПроверяемыеРеквизиты, "Конец");
КонецПроцедуры

&НаСервере
Процедура ПриСохраненииДанныхВНастройкахНаСервере(Настройки)
	УправляемыеФормыСервер.ПриСохраненииДанныхВНастройкахНаСервере(ЭтаФорма, Настройки, "Начало");
	//Вставить содержимое обработчика
	УправляемыеФормыСервер.ПриСохраненииДанныхВНастройкахНаСервере(ЭтаФорма, Настройки, "Конец");
КонецПроцедуры

&НаСервере
Процедура ПередЗагрузкойДанныхИзНастроекНаСервере(Настройки)
	УправляемыеФормыСервер.ПередЗагрузкойДанныхИзНастроекНаСервере(ЭтаФорма, Настройки, "Начало");
	//Вставить содержимое обработчика
	УправляемыеФормыСервер.ПередЗагрузкойДанныхИзНастроекНаСервере(ЭтаФорма, Настройки, "Конец");
КонецПроцедуры

&НаСервере
Процедура ПриЗагрузкеДанныхИзНастроекНаСервере(Настройки)
	УправляемыеФормыСервер.ПриЗагрузкеДанныхИзНастроекНаСервере(ЭтаФорма, Настройки, "Начало");
	//Вставить содержимое обработчика
	УправляемыеФормыСервер.ПриЗагрузкеДанныхИзНастроекНаСервере(ЭтаФорма, Настройки, "Конец");
КонецПроцедуры




// КЛИЕНТ

&НаКлиенте
Процедура ПередЗакрытием(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ПередЗакрытием(ЭтаФорма, Отказ, ЗавершениеРаботы, ТекстПредупреждения,СтандартнаяОбработка, "Начало");	
	//Вставить содержимое обработчика
	УправляемыеФормыКлиент.ПередЗакрытием(ЭтаФорма, Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ПриЗакрытии(ЗавершениеРаботы)
	УправляемыеФормыКлиент.ПриЗакрытии(ЭтаФорма, ЗавершениеРаботы, "Начало");	
	//Вставить содержимое обработчика
	УправляемыеФормыКлиент.ПриЗакрытии(ЭтаФорма, ЗавершениеРаботы, "Конец");	
КонецПроцедуры



&НаКлиенте
Процедура ПриОткрытии(Отказ)
	УправляемыеФормыКлиент.ПриОткрытии(ЭтаФорма, Отказ, "Начало");	
	//Вставить содержимое обработчика
	УправляемыеФормыКлиент.ПриОткрытии(ЭтаФорма, Отказ, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ПриПовторномОткрытии()
	УправляемыеФормыКлиент.ПриПовторномОткрытии(ЭтаФорма, "Начало");	
	//Вставить содержимое обработчика
	УправляемыеФормыКлиент.ПриПовторномОткрытии(ЭтаФорма, "Конец");	
КонецПроцедуры


&НаКлиенте
Процедура ОбработкаВыбора(ВыбранноеЗначение, ИсточникВыбора)
	УправляемыеФормыКлиент.ОбработкаВыбора(ЭтаФорма, ВыбранноеЗначение, ИсточникВыбора, "Начало");	
	//Вставить содержимое обработчика
	УправляемыеФормыКлиент.ОбработкаВыбора(ЭтаФорма, ВыбранноеЗначение, ИсточникВыбора, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	УправляемыеФормыКлиент.ОбработкаОповещения(ЭтаФорма, ИмяСобытия, Параметр, Источник, "Начало");	
	//Вставить содержимое обработчика
	УправляемыеФормыКлиент.ОбработкаОповещения(ЭтаФорма, ИмяСобытия, Параметр, Источник, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаАктивизации(АктивныйОбъект, Источник)
	УправляемыеФормыКлиент.ОбработкаАктивизации(ЭтаФорма, АктивныйОбъект, Источник, "Начало");	
	//Вставить содержимое обработчика
	УправляемыеФормыКлиент.ОбработкаАктивизации(ЭтаФорма, АктивныйОбъект, Источник, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаЗаписиНового(НовыйОбъект, Источник, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ОбработкаЗаписиНового(ЭтаФорма, НовыйОбъект, Источник, СтандартнаяОбработка, "Начало");	
	//Вставить содержимое обработчика
	УправляемыеФормыКлиент.ОбработкаЗаписиНового(ЭтаФорма, НовыйОбъект, Источник, СтандартнаяОбработка, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ВнешнееСобытие(Источник, Событие, Данные)
	УправляемыеФормыКлиент.ВнешнееСобытие(ЭтаФорма, Источник, Событие, Данные, "Начало");	
	//Вставить содержимое обработчика
	УправляемыеФормыКлиент.ВнешнееСобытие(ЭтаФорма, Источник, Событие, Данные, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаНавигационнойСсылки(НавигационнаяСсылкаФорматированнойСтроки, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ОбработкаНавигационнойСсылки(ЭтаФорма, НавигационнаяСсылкаФорматированнойСтроки, СтандартнаяОбработка, "Начало");	
	//Вставить содержимое обработчика
	УправляемыеФормыКлиент.ОбработкаНавигационнойСсылки(ЭтаФорма, НавигационнаяСсылкаФорматированнойСтроки, СтандартнаяОбработка, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаПерехода(ОбъектПерехода, СтандартнаяОбработка)
	УправляемыеФормыКлиент.ОбработкаПерехода(ЭтаФорма, ОбъектПерехода, СтандартнаяОбработка, "Начало");	
	//Вставить содержимое обработчика
	УправляемыеФормыКлиент.ОбработкаПерехода(ЭтаФорма, ОбъектПерехода, СтандартнаяОбработка, "Конец");	
КонецПроцедуры

&НаКлиенте
Процедура ПриИзмененииПараметровЭкрана()
	УправляемыеФормыКлиент.ПриИзмененииПараметровЭкрана(ЭтаФорма, "Начало");	
	//Вставить содержимое обработчика
	УправляемыеФормыКлиент.ПриИзмененииПараметровЭкрана(ЭтаФорма, "Конец");	
КонецПроцедуры



&НаКлиенте
Функция ВыполняемсяНаКлиенте(Действие, Параметры = Неопределено) Экспорт
	Результат = Неопределено;
	Выполнить(Действие);
	Возврат Результат;	
КонецФункции
&НаСервере
Функция ВыполняемсяНаСервере(Действие, Параметры = Неопределено) Экспорт
	Результат = Неопределено;
	Выполнить(Действие);
	Возврат Результат;	
КонецФункции
