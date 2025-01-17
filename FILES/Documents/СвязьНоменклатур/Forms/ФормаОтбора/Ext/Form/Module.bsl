﻿

&НаКлиенте
Процедура ДобавитьЭлемент(Команда)
	Родитель = РучнойОтбор.ПолучитьЭлементы();
	ТД = Элементы.РучнойОтбор.ТекущиеДанные;
	Если НЕ ТД = Неопределено Тогда
		Если ТД.ЭтоГруппа Тогда
			Родитель = Элементы.РучнойОтбор.ТекущиеДанные.ПолучитьЭлементы();
		КонецЕсли;
	КонецЕсли;
		
	Элемент = Родитель.Добавить();
	Элемент.ЭтоГруппа = Ложь;
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьГруппу(Команда)
	Элемент = РучнойОтбор.ПолучитьЭлементы().Добавить();
	Элемент.ТипГруппы = ТипГруппыЭлементовОтбораКомпоновкиДанных.ГруппаИли;
	Элемент.ЭтоГруппа = Истина;
КонецПроцедуры

&НаКлиенте
Процедура РучнойОтборПриАктивизацииСтроки(Элемент)
	
	Если НЕ Элементы.РучнойОтбор.ТекущиеДанные = Неопределено Тогда
		ТекущиеДанные = Элементы.РучнойОтбор.ТекущиеДанные;
		Если НЕ ТекущиеДанные.ЭтоГруппа Тогда
			Элементы.ГруппаГрупп.Видимость = Ложь;
			Элементы.ГруппаЭлементов.Видимость = Истина;
		Иначе	
			Элементы.ГруппаГрупп.Видимость = Истина;
			Элементы.ГруппаЭлементов.Видимость = Ложь;
		КонецЕсли;
		
		//Элементы.РучнойОтборПравоеЗначениеЭкстаПолей.Доступность = Ложь;			
		//Элементы.РучнойОтборПравоеЗначение.Доступность = Ложь;
		//Если ТипЗнч(ТекущиеДанные.ЛевоеЗначение) = Тип("ПланВидовХарактеристикСсылка.НаборХарактеристикДляНоменклатуры") Тогда
		//	Элементы.РучнойОтборПравоеЗначение.Доступность = Истина;			
		//ИначеЕсли ТипЗнч(ТекущиеДанные.ЛевоеЗначение) = Тип("ПланВидовХарактеристикСсылка.НаборХарактеристикДляЭкстраПолей") Тогда
		//	Элементы.РучнойОтборПравоеЗначениеЭкстаПолей.Доступность = Истина;			
		//КонецЕсли;	
			
	КонецЕсли;

КонецПроцедуры


&НаКлиенте
Процедура РучнойОтборЛевоеЗначениеНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	//Если НЕ Элементы.РучнойОтбор.ТекущиеДанные = Неопределено Тогда
	//	ТекущиеДанные = Элементы.РучнойОтбор.ТекущиеДанные;
	//	
	//	Элементы.РучнойОтборПравоеЗначениеЭкстаПолей.Доступность = Ложь;			
	//	Элементы.РучнойОтборПравоеЗначение.Доступность = Ложь;
	//	Если ТипЗнч(ТекущиеДанные.ЛевоеЗначение) = Тип("ПланВидовХарактеристикСсылка.НаборХарактеристикДляНоменклатуры") Тогда
	//		Элементы.РучнойОтборПравоеЗначение.Доступность = Истина;			
	//	ИначеЕсли ТипЗнч(ТекущиеДанные.ЛевоеЗначение) = Тип("ПланВидовХарактеристикСсылка.НаборХарактеристикДляЭкстраПолей") Тогда
	//		Элементы.РучнойОтборПравоеЗначениеЭкстаПолей.Доступность = Истина;			
	//	КонецЕсли;	
	//КонецЕсли;
КонецПроцедуры

&НаСервере
Функция ПолучитьJSON()
	ДЗ = ДанныеФормыВЗначение(РучнойОтбор,Тип("ДеревоЗначений"));
	ОбъектXDTO = СериализаторXDTO.ЗаписатьXDTO(ДЗ);
	
	Попытка
		ЗаписьJSON = Новый ЗаписьJSON;
		ЗаписьJSON.УстановитьСтроку();
		ФабрикаXDTO.ЗаписатьJSON(ЗаписьJSON, ОбъектXDTO);
		Стр = ЗаписьJSON.Закрыть(); 
	Исключение
		ЗаписьJSON = Новый ЗаписьXML;
		ЗаписьJSON.УстановитьСтроку();
		ФабрикаXDTO.ЗаписатьXML(ЗаписьJSON, ОбъектXDTO);
		Стр = ЗаписьJSON.Закрыть(); 
	КонецПопытки;
	
	Возврат Стр; 
КонецФункции

&НаСервере
Функция ПолучитьПредставление()
	ДЗ = ДанныеФормыВЗначение(РучнойОтбор,Тип("ДеревоЗначений"));
	Возврат УправлениеБТСервер.РекурсивныйОбходПредставления(ДЗ);
КонецФункции

&НаКлиенте
Процедура СоздатьПравилоИЗакрыть(Команда)
	
	Результат = Новый Структура("ДеревоПравил, Представление");
	Результат.ДеревоПравил = ПолучитьJSON();
	Результат.Представление = ПолучитьПредставление();
	
	Закрыть(Результат);
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ДеревоПравил = "";
	ЭтаФорма.Параметры.Свойство("ДеревоПравил", ДеревоПравил);
	
	Если ЗначениеЗаполнено(ДеревоПравил) Тогда
		
		ЧтениеJSON = Новый ЧтениеJSON; 
		ЧтениеJSON.УстановитьСтроку(ДеревоПравил);
		ТипОбъектаXDTO = ФабрикаXDTO.Тип("http://v8.1c.ru/8.1/data/core", "ValueTree");
		ОбъектXDTO = ФабрикаXDTO.ПрочитатьJSON(ЧтениеJSON,ТипОбъектаXDTO); 
		ОбъектXDTO.Проверить();
		
		ДЗ = СериализаторXDTO.ПрочитатьXDTO(ОбъектXDTO);
		ЗначениеВДанныеФормы(ДЗ, РучнойОтбор);
	КонецЕсли;
КонецПроцедуры


