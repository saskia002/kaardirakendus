DO $$
    DECLARE width_id stage_data_type.id%TYPE; -- width
    DECLARE depth_id stage_data_type.id%TYPE; -- depth
    DECLARE step_amount_id stage_data_type.id%TYPE; -- step_amount
    DECLARE built_when_id stage_data_type.id%TYPE; -- built_when
    DECLARE built_by_id stage_data_type.id%TYPE; -- built_by
    DECLARE history_id stage_data_type.id%TYPE; -- history
    DECLARE weather_id stage_data_type.id%TYPE; -- weather
    DECLARE wind_id stage_data_type.id%TYPE; -- wind m/s
    DECLARE measure_date_id stage_data_type.id%TYPE; -- date of measuring
    DECLARE selected_stage_id INTEGER;

    BEGIN
        -- inserting categories
        INSERT INTO stage_data_type (type, deleted, created, edited)
        VALUES ('Laius', false, NOW(), NOW())
        RETURNING id INTO width_id;

        INSERT INTO stage_data_type (type, deleted, created, edited)
        VALUES ('Sügavus', false, NOW(), NOW())
        RETURNING id INTO depth_id;

        INSERT INTO stage_data_type (type, deleted, created, edited)
        VALUES ('Astmete arv', false, NOW(), NOW())
        RETURNING id INTO step_amount_id;

        INSERT INTO stage_data_type (type, deleted, created, edited)
        VALUES ('Kuna ehitati', false, NOW(), NOW())
        RETURNING id INTO built_when_id;

        INSERT INTO stage_data_type (type, deleted, created, edited)
        VALUES ('Kes ehitas', false, NOW(), NOW())
        RETURNING id INTO built_by_id;

        INSERT INTO stage_data_type (type, deleted, created, edited)
        VALUES ('Ajalugu', false, NOW(), NOW())
        RETURNING id INTO history_id;

        INSERT INTO stage_data_type (type, deleted, created, edited)
        VALUES ('Ilm', false, NOW(), NOW())
        RETURNING id INTO weather_id;

        INSERT INTO stage_data_type (type, deleted, created, edited)
        VALUES ('Tuul', false, NOW(), NOW())
        RETURNING id INTO wind_id;

        INSERT INTO stage_data_type (type, deleted, created, edited)
        VALUES ('Mõõtmise kuupäev', false, NOW(), NOW())
        RETURNING id INTO measure_date_id;

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Lehetu kõlakoda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES
            (selected_stage_id, width_id, '8.14', false, NOW(), NOW()),
            (selected_stage_id, depth_id, '4.52', false, NOW(), NOW()),
            (selected_stage_id, step_amount_id, '0', false, NOW(), NOW()),
            (selected_stage_id, built_when_id, '1968', false, NOW(), NOW()),
            (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
            (selected_stage_id, history_id, 'Esialgu oli hoone kasutamise eesmärk varjualune, kus lasteaia lapsed saaksid vihma korral värskes õhus mängida. Täna kannab hoone ametlikku nime – kõlakoda ja on sihipärases kasutuses läbi aasta.', false, NOW(), NOW()),
            (selected_stage_id, weather_id, 'Pilvine, kuiv, tuulevaikne', false, NOW(), NOW()),
            (selected_stage_id, wind_id, '', false, NOW(), NOW()),
            (selected_stage_id, measure_date_id, '28.02.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Varbola kõlakoda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES
            (selected_stage_id, width_id, '9.07', false, NOW(), NOW()),
            (selected_stage_id, depth_id, '7.3', false, NOW(), NOW()),
            (selected_stage_id, step_amount_id, '2', false, NOW(), NOW()),
            (selected_stage_id, built_when_id, '2015', false, NOW(), NOW()),
            (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
            (selected_stage_id, history_id, 'Varbola linnust haldav RMK on linnuse korrastamisel palju ära teinud, aga hea juurde tahaks veel paremat. MTÜ Rahvusliku Ehituse Selts püstitas kevadel linnusele uue välilava. Varbola külavanem Maire Põhjala tõi välja, et väga oleks siia tagasi vaja istepinke. Pehkinud pingid koristas haldaja ära, kontserte kuulatakse nüüd maas istudes. Põhjala ütles, et paljud haigete jalgadega (vanemad) inimesed ei saa juba sellepärast siia kontserte kuulama tulla, et jalgel seista ei jõua ja maast püsti on raske tõusta. ', false, NOW(), NOW()),
            (selected_stage_id, weather_id, 'Pilvine, kuiv, udune', false, NOW(), NOW()),
            (selected_stage_id, wind_id, '', false, NOW(), NOW()),
            (selected_stage_id, measure_date_id, '28.02.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Kärla kõlakoda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES
            (selected_stage_id, width_id, '8.27', false, NOW(), NOW()),
            (selected_stage_id, depth_id, '5.50', false, NOW(), NOW()),
            (selected_stage_id, step_amount_id, '0', false, NOW(), NOW()),
            (selected_stage_id, built_when_id, '2012', false, NOW(), NOW()),
            (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
            (selected_stage_id, history_id, '2012 kell 16 panid vallavanem Villi Pihl ja valla kultuurijuht Virge Varilepp nurgakivi uuele kõlakojale. Ka tantsupõrand loodeti uuendada. Vana tantsupõranda viimase tantsupaarina jäävad Kärla kultuurilukku Harri Kõrvits ja Virge Varilepp. Loodeti 9. augustiks, mil pidi toimuma III Kärla Triip, saab ka igatsetud uus kõlakoda valmis.. ', false, NOW(), NOW()),
            (selected_stage_id, weather_id, 'Pilvine, kuiv, kagutuul', false, NOW(), NOW()),
            (selected_stage_id, wind_id, '7-13 m/s', false, NOW(), NOW()),
            (selected_stage_id, measure_date_id, '02.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Kelvingi kõlakoda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES
            (selected_stage_id, width_id, '10', false, NOW(), NOW()),
            (selected_stage_id, depth_id, '4', false, NOW(), NOW()),
            (selected_stage_id, step_amount_id, '3, 20 cm', false, NOW(), NOW()),
            (selected_stage_id, built_when_id, '2016', false, NOW(), NOW()),
            (selected_stage_id, built_by_id, 'Ants Rand', false, NOW(), NOW()),
            (selected_stage_id, history_id, 'Kõlakoja valmimist vedas Kelvingi külavanem, Viimsi aukodanik ja esimene vallavanem Ants-Hembo Lindemann. Tema nägi sellist kõlakoda Saaremaal ja leidis, et see sobiks ka Kelvingisse hästi. Nüüd ongi Eestimaal kaks ühesugust laululava: üks Saaremaal ja teine Kelvingis. Üks erinevus on ainult selles,et Saaremaal on kõlakoja tipus draakon, aga Kelvingis on põder ning kaare all lehvitab oma tiibu puust kotkas. Avamisel proovisid lava ära Randvere pasunakoor, tantsurühm Kobarake, Leigarid ja Leesikad, tantsuks mängis Olev Mäe ja küla poisid.', false, NOW(), NOW()),
            (selected_stage_id, weather_id, 'Selge, kuiv, tuulevaikne', false, NOW(), NOW()),
            (selected_stage_id, wind_id, '', false, NOW(), NOW()),
            (selected_stage_id, measure_date_id, '11.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Kirna laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES
            (selected_stage_id, width_id, '7.03', false, NOW(), NOW()),
            (selected_stage_id, depth_id, '5.31', false, NOW(), NOW()),
            (selected_stage_id, step_amount_id, '0', false, NOW(), NOW()),
            (selected_stage_id, built_when_id, '2023', false, NOW(), NOW()),
            (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
            (selected_stage_id, history_id, 'Kirna laululava ehitati 2023. aasta juunis ja on eraisikute kingitus Lääne-Nigula vallale. Kuna laululava pole veel päris valmis, siis kasutusluba pole.', false, NOW(), NOW()),
            (selected_stage_id, weather_id, 'Pilvine, kuiv, tuul', false, NOW(), NOW()),
            (selected_stage_id, wind_id, '3-7 m/s', false, NOW(), NOW()),
            (selected_stage_id, measure_date_id, '31.03.2024', false, NOW(), NOW());
    END;
$$;