﻿
Процедура ПриЗаписи(Отказ)
	МодульОбъектаСервер.ПриЗаписи(ЭтотОбъект, Отказ, "Начало");
	//
	МодульОбъектаСервер.ПриЗаписи(ЭтотОбъект, Отказ, "Конец");
КонецПроцедуры


Процедура ОбработкаПроведения(Отказ, РежимПроведения)	
	
	МодульОбъектаСервер.ОбработкаПроведения(ЭтотОбъект, Отказ, РежимПроведения, "Начало");

	Если НЕ МодульОбъектаСервер.ОбработкаПроведения(ЭтотОбъект, Отказ, РежимПроведения, "Вместо") Тогда
		
		// регистр БалансПоПродажамУслугИТоварамБТ Расход
		Движения.БалансПоПродажамУслугИТоварамБТ.Очистить();
		Движения.БалансПоПродажамУслугИТоварамБТ.Записывать = Истина;
		Для Каждого ТекСтрокаПоУслугам Из ПоУслугам Цикл
			Движение = Движения.БалансПоПродажамУслугИТоварамБТ.Добавить();
			Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
			Движение.Период = Дата;
			Движение.Организация = Организация;
			Движение.Партнер = Партнер;
			Движение.Контрагент = Контрагент;
			Движение.Договор = Договор;
			Движение.Услуга = ТекСтрокаПоУслугам.Услуга;
			Движение.Сумма = ТекСтрокаПоУслугам.Сумма;
		КонецЦикла;

		// регистр БалансПоЭкстраПолям Расход
		Запрос = Новый Запрос;
		Запрос.УстановитьПараметр("Ссылка", ЭтотОбъект.Ссылка);
		Запрос.Текст = "ВЫБРАТЬ
		               |	ЗНАЧЕНИЕ(ВидДвиженияНакопления.Расход) КАК ВидДвижения,
		               |	ЗачетОплатыПоУслугам.Ссылка.Дата КАК Период,
		               |	ЗачетОплатыПоУслугам.Ссылка.Организация КАК Организация,
		               |	ЗачетОплатыПоУслугам.Ссылка.Партнер КАК Партнер,
		               |	ЗачетОплатыПоУслугам.Ссылка.Контрагент КАК Контрагент,
		               |	ЗачетОплатыПоУслугам.Ссылка.Договор КАК Договор,
		               |	ЗачетОплатыПоУслугам.Услуга КАК Услуга,
		               |	УслугаЭкстраПоля.Характеристика КАК ЭкстраПоле,
		               |	УслугаЭкстраПоля.Значение КАК ЗначениеЭкстраПоля,
		               |	ЗачетОплатыПоУслугам.Сумма КАК Сумма
		               |ИЗ
		               |	Документ.ЗачетОплаты.ПоУслугам КАК ЗачетОплатыПоУслугам
		               |		ЛЕВОЕ СОЕДИНЕНИЕ Документ.Услуга.ЭкстраПоля КАК УслугаЭкстраПоля
		               |		ПО ЗачетОплатыПоУслугам.Услуга = УслугаЭкстраПоля.Ссылка
		               |ГДЕ
		               |	ЗачетОплатыПоУслугам.Ссылка = &Ссылка";
		Движения.БалансПоЭкстраПолям.Записывать = Истина;
		Движения.БалансПоЭкстраПолям.Загрузить(Запрос.Выполнить().Выгрузить());

		//ОплатаЗаказовКлиентаБТ
		Запрос = Новый Запрос;
		Запрос.УстановитьПараметр("Ссылка", ЭтотОбъект.Ссылка);
		Запрос.Текст = "ВЫБРАТЬ
		               |	СУММА(ЗачетОплатыПоУслугам.Сумма) КАК СуммаОплачено,
		               |	УслугиВЗаказеКлиента.ЗаказКлиентаБТ КАК ЗаказКлиентаБТ,
		               |	ЗачетОплатыПоУслугам.Ссылка КАК ДокументОплаты
		               |ИЗ
		               |	Документ.ЗачетОплаты.ПоУслугам КАК ЗачетОплатыПоУслугам
		               |		ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.УслугиВЗаказеКлиента КАК УслугиВЗаказеКлиента
		               |		ПО ЗачетОплатыПоУслугам.Услуга = УслугиВЗаказеКлиента.Услуга
		               |ГДЕ
		               |	ЗачетОплатыПоУслугам.Ссылка = &Ссылка
		               |
		               |СГРУППИРОВАТЬ ПО
		               |	УслугиВЗаказеКлиента.ЗаказКлиентаБТ,
		               |	ЗачетОплатыПоУслугам.Ссылка";
		Движения.ОплатаЗаказовКлиентаБТ.Записывать = Истина;
		Движения.ОплатаЗаказовКлиентаБТ.Загрузить(Запрос.Выполнить().Выгрузить());
	КонецЕсли;			

	МодульОбъектаСервер.ОбработкаПроведения(ЭтотОбъект, Отказ, РежимПроведения, "Конец");
	
КонецПроцедуры

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка)
	МодульОбъектаСервер.ОбработкаЗаполнения(ЭтотОбъект, ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка, "Начало");
	//
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
	МодульОбъектаСервер.ПередУдалением(ЭтотОбъект, Отказ, "Конец");
КонецПроцедуры

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	МодульОбъектаСервер.ПередЗаписью(ЭтотОбъект, Отказ, РежимЗаписи, РежимПроведения, "Начало");
	//	
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
