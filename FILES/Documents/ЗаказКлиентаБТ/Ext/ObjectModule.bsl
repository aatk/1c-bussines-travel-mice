﻿
Процедура ЗаполнитьВычисляемыеРеквизиты() Экспорт
	
	СуммаДокумента = 0;
	Для Каждого Товар ИЗ ЭтотОбъект.Товары Цикл
		СуммаДокумента = СуммаДокумента + Товар.СуммаСНДС;	
	КонецЦикла;
	ЭтотОбъект.СуммаДокумента = СуммаДокумента;
	
КонецПроцедуры



Процедура ПриЗаписи(Отказ)
	
	МодульОбъектаСервер.ПриЗаписи(ЭтотОбъект, Отказ, "Начало");
	//
	Если НЕ МодульОбъектаСервер.ПриЗаписи(ЭтотОбъект, Отказ, "Вместо") Тогда	
		УправлениеБТСервер.ЗаполнитьДополнительныеНомераВЗаказеКлиента(ЭтотОбъект);
	КонецЕсли;
	
	МодульОбъектаСервер.ПриЗаписи(ЭтотОбъект, Отказ, "Конец");

КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, РежимПроведения)	
	
	МодульОбъектаСервер.ОбработкаПроведения(ЭтотОбъект, Отказ, РежимПроведения, "Начало");

	Если НЕ МодульОбъектаСервер.ОбработкаПроведения(ЭтотОбъект, Отказ, РежимПроведения, "Вместо") Тогда
		
		УправлениеБТСервер.ЗаписатьGUID(Ссылка);

		РазрешенныеСтатусы = Новый Массив;
		РазрешенныеСтатусы.Добавить(Перечисления.СтатусыУслуг.УслугаРеализована);
		РазрешенныеСтатусы.Добавить(Перечисления.СтатусыУслуг.УслугаНеПродается);
		
		Запрос = Новый Запрос;
		Запрос.УстановитьПараметр("Ссылка", ЭтотОбъект.Ссылка);
		Запрос.УстановитьПараметр("Статус", РазрешенныеСтатусы);
		Запрос.Текст = "ВЫБРАТЬ
		               |	ЗаказКлиентаБТТовары.Услуга,
		               |	ЕСТЬNULL(СтатусУслугиПродажаСрезПоследних.Статус, ЗНАЧЕНИЕ(Перечисление.СтатусыУслуг.Новый)) КАК Статус
		               |ИЗ
		               |	Документ.ЗаказКлиентаБТ.Товары КАК ЗаказКлиентаБТТовары
		               |		ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.СтатусУслугиПродажа.СрезПоследних КАК СтатусУслугиПродажаСрезПоследних
		               |		ПО ЗаказКлиентаБТТовары.Услуга = СтатусУслугиПродажаСрезПоследних.Услуга
		               |ГДЕ
		               |	ЗаказКлиентаБТТовары.Ссылка = &Ссылка
		               |	И НЕ ЕСТЬNULL(СтатусУслугиПродажаСрезПоследних.Статус, ЗНАЧЕНИЕ(Перечисление.СтатусыУслуг.Новый)) В (&Статус)";
		Выборка = Запрос.Выполнить().Выбрать();			   
		Пока Выборка.Следующий() Цикл
			Отказ = Истина;
			Сообщить(Строка(Выборка.Услуга) + " в статусе " + Строка(Выборка.Статус) + " должен быть статус - Услуга реализована или Услуга Не Продается");
		КонецЦикла;
					   
		Если НЕ Отказ Тогда 			   
			// регистр УслугиДляЗаказовИзКорзины
			Движения.УслугиВЗаказеКлиента.Записывать = Истина;
			Движения.УслугиВЗаказеКлиента.Очистить();	
			Для Каждого СтрокаСТоваром ИЗ ЭтотОбъект.Товары Цикл
				Движение = Движения.УслугиВЗаказеКлиента.Добавить();
				Движение.Услуга = СтрокаСТоваром.Услуга;
				Движение.ЗаказКлиентаБТ = Ссылка;
			КонецЦикла;
			
			Запрос = Новый Запрос;
			Запрос.УстановитьПараметр("Ссылка", ЭтотОбъект.Ссылка);
			Запрос.Текст = "ВЫБРАТЬ
			               |	ЗаказКлиентаБТТовары.Услуга,
			               |	ЗаказКлиентаБТТовары.Ссылка КАК ВЗаказе
			               |ИЗ
			               |	Документ.ЗаказКлиентаБТ.Товары КАК ЗаказКлиентаБТТовары
			               |ГДЕ
			               |	ЗаказКлиентаБТТовары.Ссылка = &Ссылка
			               |	И ЗаказКлиентаБТТовары.Услуга <> ЗНАЧЕНИЕ(Документ.Услуга.ПустаяСсылка)";
			ТоварыПодготовленные = Запрос.Выполнить().Выгрузить();	
			Для Каждого СтрокаТовара ИЗ ТоварыПодготовленные Цикл
				МЗ = РегистрыСведений.ПодготовитьДляФормированияДокументов.СоздатьМенеджерЗаписи();
				МЗ.Услуга = СтрокаТовара.Услуга;
				МЗ.Прочитать();
				Если МЗ.Выбран() Тогда
					МЗ.Услуга = СтрокаТовара.Услуга;
					МЗ.Удалить();
				КонецЕсли;	
				//МЗ.Услуга = СтрокаТовара.Услуга;				
				//МЗ.ЗаказКомандированного = СтрокаТовара.ЗаказКомандируемого; //Нахрен оно нужно?
				//МЗ.ВЗаказе = СтрокаТовара.ВЗаказе;                           //Нахрен оно нужно?
				//МЗ.Записать(Истина);
			КонецЦикла;
			
			Движения.ОписаниеУслугВЗаказахКлиентаБТ.Записывать = Истина;
			Движения.ОписаниеУслугВЗаказахКлиентаБТ.Очистить();
			Для Каждого СтрокаСОписанием ИЗ ЭтотОбъект.ОписаниеУслуг Цикл
				Движение = Движения.ОписаниеУслугВЗаказахКлиентаБТ.Добавить();
				Движение.ЗаказКлиентаБТ = Ссылка;
				Движение.Характеристика = СтрокаСОписанием.Характеристика;
				Движение.Значение = СтрокаСОписанием.Значение;
			КонецЦикла;

			
			//// БалансПоЭкстраПолям
			Запрос = Новый Запрос;
			Запрос.УстановитьПараметр("Ссылка", ЭтотОбъект.Ссылка);
			Запрос.Текст = "ВЫБРАТЬ
			               |	ЗНАЧЕНИЕ(ВидДвиженияНакопления.Приход) КАК ВидДвижения,
			               |	ЗаказКлиентаБТТовары.Ссылка.Дата КАК Период,
			               |	ЗаказКлиентаБТТовары.Ссылка.Организация КАК Организация,
			               |	ЗаказКлиентаБТТовары.Ссылка.Партнер КАК Партнер,
			               |	ЗаказКлиентаБТТовары.Ссылка.Контрагент КАК Контрагент,
			               |	ЗаказКлиентаБТТовары.Ссылка.Договор КАК Договор,
			               |	ЗаказКлиентаБТТовары.Услуга КАК Услуга,
			               |	УслугаЭкстраПоля.Характеристика КАК ЭкстраПоле,
			               |	УслугаЭкстраПоля.Значение КАК ЗначениеЭкстраПоля,
			               |	ЗаказКлиентаБТТовары.СуммаСНДС КАК Сумма
			               |ИЗ
			               |	Документ.ЗаказКлиентаБТ.Товары КАК ЗаказКлиентаБТТовары
			               |		ЛЕВОЕ СОЕДИНЕНИЕ Документ.Услуга.ЭкстраПоля КАК УслугаЭкстраПоля
			               |		ПО ЗаказКлиентаБТТовары.Услуга = УслугаЭкстраПоля.Ссылка
			               |ГДЕ
			               |	ЗаказКлиентаБТТовары.Ссылка = &Ссылка";
			Движения.БалансПоЭкстраПолям.Записывать = Истина;
			Движения.БалансПоЭкстраПолям.Загрузить(Запрос.Выполнить().Выгрузить());
			
			
			//// БалансПоПродажамУслугИТоварамБТ
			Запрос = Новый Запрос;
			Запрос.УстановитьПараметр("Ссылка", ЭтотОбъект.Ссылка);
			Запрос.Текст = "ВЫБРАТЬ
			               |	ЗНАЧЕНИЕ(ВидДвиженияНакопления.Приход) КАК ВидДвижения,
			               |	ЗаказКлиентаБТТовары.Ссылка.Дата КАК Период,
			               |	ЗаказКлиентаБТТовары.Ссылка.Организация КАК Организация,
			               |	ЗаказКлиентаБТТовары.Ссылка.Партнер КАК Партнер,
			               |	ЗаказКлиентаБТТовары.Ссылка.Контрагент КАК Контрагент,
			               |	ЗаказКлиентаБТТовары.Ссылка.Договор КАК Договор,
			               |	ЗаказКлиентаБТТовары.Услуга КАК Услуга,
			               |	ЗаказКлиентаБТТовары.СуммаСНДС КАК Сумма
			               |ИЗ
			               |	Документ.ЗаказКлиентаБТ.Товары КАК ЗаказКлиентаБТТовары
			               |ГДЕ
			               |	ЗаказКлиентаБТТовары.Ссылка = &Ссылка";
			Движения.БалансПоПродажамУслугИТоварамБТ.Записывать = Истина;
			Движения.БалансПоПродажамУслугИТоварамБТ.Загрузить(Запрос.Выполнить().Выгрузить());
			
		КонецЕсли;
		
		
	КонецЕсли;

	МодульОбъектаСервер.ОбработкаПроведения(ЭтотОбъект, Отказ, РежимПроведения, "Конец");

КонецПроцедуры

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка)
	
	МодульОбъектаСервер.ОбработкаЗаполнения(ЭтотОбъект, ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка, "Начало");
	
	Если НЕ МодульОбъектаСервер.ОбработкаЗаполнения(ЭтотОбъект, ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка, "Вместо") Тогда	
		
		Если ТипЗнч(ДанныеЗаполнения) = Тип("Массив") Тогда
			Для Каждого ОбъектЗаполнения ИЗ ДанныеЗаполнения Цикл
				ЗаполнитьЗначенияСвойств(ЭтотОбъект, ОбъектЗаполнения,, "Дата, Номер");
				Попытка
					ЭтотОбъект.Организация = ОбъектЗаполнения.Организация; //Справочники.Организации.ОрганизацияПоУмолчанию();
					ЭтотОбъект.Автор = ПараметрыСеанса.ТекущийПользователь.Ссылка;
					ЭтотОбъект.Менеджер = ПараметрыСеанса.ТекущийПользователь.Ссылка;
				Исключение
					
				КонецПопытки;
				
				Если ТипЗнч(ОбъектЗаполнения) = Тип("ДокументСсылка.Услуга") Тогда
					УправлениеБТВызовСервера.ВключитьУслугуВЗаказКлиента(ОбъектЗаполнения, ЭтотОбъект);			
				ИначеЕсли ТипЗнч(ОбъектЗаполнения) = Тип("ДокументСсылка.ЗаказКомандированногоБТ") Тогда
					МассивКомандировок = Новый Массив;
					МассивКомандировок.Добавить(ОбъектЗаполнения);
					МассивЗаказовИУслуг = УправлениеБТВызовСервера.СформироватьЗаказыКлиентовНаСервере(МассивКомандировок);
					УслугаМассив = МассивЗаказовИУслуг[0];
					Для Каждого МассивУслуг ИЗ УслугаМассив Цикл
						ДокументЗаказ = УправлениеБТВызовСервера.СоздатьПакетДокументовБТ(МассивУслуг, ЭтотОбъект);
					КонецЦикла;						
				КонецЕсли;
				
				
			КонецЦикла;
		ИначеЕсли ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.Услуга") Тогда
			
			ОбъектЗаполнения = ДанныеЗаполнения;
			ЗаполнитьЗначенияСвойств(ЭтотОбъект, ОбъектЗаполнения,, "Дата, Номер");
			Попытка
				ЭтотОбъект.Организация = Справочники.Организации.ОрганизацияПоУмолчанию();
				ЭтотОбъект.Автор = ПараметрыСеанса.ТекущийПользователь.Ссылка;
				ЭтотОбъект.Менеджер = ПараметрыСеанса.ТекущийПользователь.Ссылка;
			Исключение
				
			КонецПопытки;
			
			Если ТипЗнч(ОбъектЗаполнения) = Тип("ДокументСсылка.Услуга") Тогда
				УправлениеБТВызовСервера.ВключитьУслугуВЗаказКлиента(ОбъектЗаполнения, ЭтотОбъект);			
			ИначеЕсли ТипЗнч(ОбъектЗаполнения) = Тип("ДокументСсылка.ЗаказКомандированногоБТ") Тогда
				МассивКомандировок = Новый Массив;
				МассивКомандировок.Добавить(ОбъектЗаполнения);
				МассивЗаказовИУслуг = УправлениеБТВызовСервера.СформироватьЗаказыКлиентовНаСервере(МассивКомандировок);
				УслугаМассив = МассивЗаказовИУслуг[0];
				Для Каждого МассивУслуг ИЗ УслугаМассив Цикл
					ДокументЗаказ = УправлениеБТВызовСервера.СоздатьПакетДокументовБТ(МассивУслуг, ЭтотОбъект);
				КонецЦикла;						
			КонецЕсли;
				
			
		КонецЕсли;
		ЭтотОбъект.СуммаДокумента = ЭтотОбъект.Товары.Итог("СуммаСНДС");

	КонецЕсли;

	МодульОбъектаСервер.ОбработкаЗаполнения(ЭтотОбъект, ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка, "Конец");
	
КонецПроцедуры

Процедура ОбработкаУдаленияПроведения(Отказ)
	МодульОбъектаСервер.ОбработкаУдаленияПроведения(ЭтотОбъект, Отказ, "Начало");
	//	
	МодульОбъектаСервер.ОбработкаУдаленияПроведения(ЭтотОбъект, Отказ, "Конец");
КонецПроцедуры

Процедура ПередУдалением(Отказ)
	
	МодульОбъектаСервер.ПередУдалением(ЭтотОбъект, Отказ, "Начало");
	//	
	Если НЕ МодульОбъектаСервер.ПередУдалением(ЭтотОбъект, Отказ,  "Вместо") Тогда
		УправлениеБТСервер.УдалитьGUID(Ссылка);
	КонецЕсли;
	
	МодульОбъектаСервер.ПередУдалением(ЭтотОбъект, Отказ, "Конец");
		
КонецПроцедуры

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	
	МодульОбъектаСервер.ПередЗаписью(ЭтотОбъект, Отказ, РежимЗаписи, РежимПроведения, "Начало");
	
	Если НЕ МодульОбъектаСервер.ПередЗаписью(ЭтотОбъект, Отказ, РежимЗаписи, РежимПроведения, "Вместо") Тогда
		ЭтотОбъект.СуммаДокумента = ЭтотОбъект.Товары.Итог("СуммаСНДС");

		Если НЕ ЗначениеЗаполнено(ЭтотОбъект.Статус) Тогда
			ЭтотОбъект.Статус = Перечисления.СтатусЗаказаКлиента.Сдан;
		КонецЕсли;
		
		Если НЕ ЗначениеЗаполнено(ЭтотОбъект.ФормаОплаты) Тогда
			ЭтотОбъект.ФормаОплаты = Перечисления.ФормыОплаты.Безналичная;
		КонецЕсли;
		
		Если НЕ ЗначениеЗаполнено(ЭтотОбъект.БанковскийСчет) Тогда
			Если УправлениеБТВызовСервера.ПолучитьНастройкуСистемы(ПланыВидовХарактеристик.НаборХарактеристикСистемный.КонфигурацияДонор) = "БухгалтерияПредприятия" Тогда
				ЭтотОбъект.БанковскийСчет = ЭтотОбъект.Организация.ОсновнойБанковскийСчет; //Справочники.БанковскиеСчетаОрганизаций.ПолучитьБанковскийСчетОрганизацииПоУмолчанию(ЭтотОбъект.Организация);
			Иначе	
				ЭтотОбъект.БанковскийСчет = Справочники.БанковскиеСчетаОрганизаций.ПолучитьБанковскийСчетОрганизацииПоУмолчанию(ЭтотОбъект.Организация);
		    КонецЕсли;
		КонецЕсли;

	КонецЕсли;

	МодульОбъектаСервер.ПередЗаписью(ЭтотОбъект, Отказ, РежимЗаписи, РежимПроведения, "Конец");
	
КонецПроцедуры

Процедура ПриУстановкеНовогоНомера(СтандартнаяОбработка, Префикс)
	МодульОбъектаСервер.ПриУстановкеНовогоНомера(ЭтотОбъект, СтандартнаяОбработка, Префикс, "Начало");
	// Вставить содержимое обработчика.
	МодульОбъектаСервер.ПриУстановкеНовогоНомера(ЭтотОбъект, СтандартнаяОбработка, Префикс, "Конец");
КонецПроцедуры

Процедура ПриКопировании(ОбъектКопирования)
	МодульОбъектаСервер.ПриКопировании(ЭтотОбъект, ОбъектКопирования, "Начало");
	// Вставить содержимое обработчика.
	МодульОбъектаСервер.ПриКопировании(ЭтотОбъект, ОбъектКопирования, "Конец");
КонецПроцедуры

Процедура ОбработкаПроверкиЗаполнения(Отказ, ПроверяемыеРеквизиты)
	МодульОбъектаСервер.ОбработкаПроверкиЗаполнения(ЭтотОбъект, Отказ, ПроверяемыеРеквизиты, "Начало");
	// Вставить содержимое обработчика.
	МодульОбъектаСервер.ОбработкаПроверкиЗаполнения(ЭтотОбъект, Отказ, ПроверяемыеРеквизиты, "Конец");
КонецПроцедуры
