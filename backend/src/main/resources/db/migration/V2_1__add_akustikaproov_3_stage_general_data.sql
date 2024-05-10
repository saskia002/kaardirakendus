DO
$$
    DECLARE
        width_id                  stage_data_type.id%TYPE; -- width
        DECLARE depth_id          stage_data_type.id%TYPE; -- depth
        DECLARE step_amount_id    stage_data_type.id%TYPE; -- step_amount
        DECLARE built_when_id     stage_data_type.id%TYPE; -- built_when
        DECLARE built_by_id       stage_data_type.id%TYPE; -- built_by
        DECLARE history_id        stage_data_type.id%TYPE; -- history
        DECLARE weather_id        stage_data_type.id%TYPE; -- weather
        DECLARE wind_id           stage_data_type.id%TYPE; -- wind m/s
        DECLARE measure_date_id   stage_data_type.id%TYPE; -- date of measuring
        DECLARE selected_stage_id INTEGER;

    BEGIN
        SELECT id INTO width_id FROM stage_data_type WHERE type = 'Laius' AND deleted = false;
        SELECT id INTO depth_id FROM stage_data_type WHERE type = 'Sügavus' AND deleted = false;
        SELECT id INTO step_amount_id FROM stage_data_type WHERE type = 'Astmete arv' AND deleted = false;
        SELECT id INTO built_when_id FROM stage_data_type WHERE type = 'Kuna ehitati' AND deleted = false;
        SELECT id INTO built_by_id FROM stage_data_type WHERE type = 'Kes ehitas' AND deleted = false;
        SELECT id INTO history_id FROM stage_data_type WHERE type = 'Ajalugu' AND deleted = false;
        SELECT id INTO weather_id FROM stage_data_type WHERE type = 'Ilm' AND deleted = false;
        SELECT id INTO wind_id FROM stage_data_type WHERE type = 'Tuul' AND deleted = false;
        SELECT id INTO measure_date_id FROM stage_data_type WHERE type = 'Mõõtmise kuupäev' AND deleted = false;

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Lehetu kõlakoda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '8.14', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '4.52', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '0', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '1968', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                'Esialgu oli hoone kasutamise eesmärk varjualune, kus lasteaia lapsed saaksid vihma korral värskes õhus mängida. Täna kannab hoone ametlikku nime – kõlakoda ja on sihipärases kasutuses läbi aasta.',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, kuiv, tuulevaikne', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '28.02.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Varbola kõlakoda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '9.07', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '7.3', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '2', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2015', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                'Varbola linnust haldav RMK on linnuse korrastamisel palju ära teinud, aga hea juurde tahaks veel paremat. MTÜ Rahvusliku Ehituse Selts püstitas kevadel linnusele uue välilava. Varbola külavanem Maire Põhjala tõi välja, et väga oleks siia tagasi vaja istepinke. Pehkinud pingid koristas haldaja ära, kontserte kuulatakse nüüd maas istudes. Põhjala ütles, et paljud haigete jalgadega (vanemad) inimesed ei saa juba sellepärast siia kontserte kuulama tulla, et jalgel seista ei jõua ja maast püsti on raske tõusta. ',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, kuiv, udune', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '28.02.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Kärla kõlakoda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '8.27', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '5.50', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '0', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2012', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                '2012 kell 16 panid vallavanem Villi Pihl ja valla kultuurijuht Virge Varilepp nurgakivi uuele kõlakojale. Ka tantsupõrand loodeti uuendada. Vana tantsupõranda viimase tantsupaarina jäävad Kärla kultuurilukku Harri Kõrvits ja Virge Varilepp. Loodeti 9. augustiks, mil pidi toimuma III Kärla Triip, saab ka igatsetud uus kõlakoda valmis.. ',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, kuiv, kagutuul', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '7-13 m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '02.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Kelvingi kõlakoda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '10', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '4', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '3, 20 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2016', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, 'Ants Rand', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                'Kõlakoja valmimist vedas Kelvingi külavanem, Viimsi aukodanik ja esimene vallavanem Ants-Hembo Lindemann. Tema nägi sellist kõlakoda Saaremaal ja leidis, et see sobiks ka Kelvingisse hästi. Nüüd ongi Eestimaal kaks ühesugust laululava: üks Saaremaal ja teine Kelvingis. Üks erinevus on ainult selles,et Saaremaal on kõlakoja tipus draakon, aga Kelvingis on põder ning kaare all lehvitab oma tiibu puust kotkas. Avamisel proovisid lava ära Randvere pasunakoor, tantsurühm Kobarake, Leigarid ja Leesikad, tantsuks mängis Olev Mäe ja küla poisid.',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge, kuiv, tuulevaikne', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '11.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Kirna laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '7.03', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '5.31', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '0', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2023', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                'Kirna laululava ehitati 2023. aasta juunis ja on eraisikute kingitus Lääne-Nigula vallale. Kuna laululava pole veel päris valmis, siis kasutusluba pole.',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, kuiv, tuul', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '3-7 m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '31.03.2024', false, NOW(), NOW());


        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Vaeküla kõlakoda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '8.1', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '2.95', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '1', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2014', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                '2014. aasta oktroobris valmis Kohaliku omaalgatuse programmi toetusmeetme abil Vaekülas, külaplatsil kõlakoda.',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge, kuiv, tuuline', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '6 m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '04.05.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Lahu laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '7.3', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '5.4', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '7', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2005', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, 'MTÜ kodukülad', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                'Esimese lava ehitasid kohalikud külaelanikud ise, kuid hiljem õnnestus saada projektile toetust ning seejärel rajati uus ning korralikum. ',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, kuiv, tuuline', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '6 m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '04.05.2024', false, NOW(), NOW());


        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Tolla külaplatsi lava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '7.32', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '3.6', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '1, 28cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2012', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id, '', false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Vihmane', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '14 m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '14.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Järlepa laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '8.78', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '4.17', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '3, 15cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2010', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, 'MTÜ Järlepa kodukultuuri Selts', false, NOW(), NOW()),
               (selected_stage_id, history_id, 'Küla laululava ehitati sellise uhke ehitisena aastal 2010 eurotoetuste abil, milles oli eestvedajaks MTÜ Järlepa kodukultuuri Selts. Isekeskis kutsutakse laululava ala ka külaplatsiks. Varem oli sel kohas üks teine puust lava, millel varjualust ei olnud, kuid oli ehitatud küla pidudeks, sest Järlepas on traditsiooniliselt ühiselt külas pidusid peetud juba ajast, mil olid mõisa ümber talud. Sel ajal küll erinevatel karja- ja heinamaadel küla ümber ja peod rändasid ühelt platsilt teisele. Küla ajalugu uurides on näha fotodelt, et nõukogude aja lõpupoole ja taasiseseisvumise järel enne mõisa erastamist, olid külapeod tihti mõisa juures, kus asus ka sovhoosi kontor. Ajad muutusid, kuid traditsioonid jäid ja 2000 paiku leidis selts külale sobiva paiga ühiste pidude pidamiseks tiigi ääres. See oli sobiv, sest asub küla ääres, samas mitte liiga kaugel enamus kohalike kodudest ja küla keskusest, kus varem oli ka pood. Kohale on lihtne ligipääseda kodust jala tulles nii noortel kui vanematel. Kohavalikul oli määravaks ka piisava elektrivõimsuse olemasolu. 2010 aastal võeti külas ette suurema ühise tegevusena külaplatsi ümber ehitamine, mil rajati laululava koos tantsupõrandaga. Platsi ehitusel osales üle 20 külaelaniku vabatahtlikena, tehes ettevalmistusi ehituseks. PRIA toetuse abil valmis tehniliselt läbimõeldud lavakompleks, mille ees asuvad ka pingid, et nautida kontserti või etendust. 2010. aastal valminud lava on ehitatud suunaga külast eemale, et pidudel kodus viibivaid elanikke vähem häirida. Küla suunale jäävad loodusliku helisummutajatena vahtrad ja teised ilupõõsad ja -puud. Lauluva kaarel on kujutatud Juuru kihelkonna rahvariiete värve. Parklana saab kasutada järve äärde viiva raja parklat, suuremate ürituste jaoks on kokkulepitud maa kasutamine parkimisel ka lähedal asuvate kinnistute omanikega.
Täna hoiavad vabatahtlikud külaelanikud ühiselt lava ümbruse korras ja hoolitsevad tantsuplatsi äärde istutatud taimede eest. Vabal ajal veedavad seal aega nii lapsed kui täiskasvanud. Ilus külaplats on visiitkaardiks nii külale kui vallale.',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, kuiv', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '14 m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '14.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Prangli laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '17.80', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '2.15', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '0', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2010', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, 'Urmas Paul', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                '25. augustil 2023 toimus Prangli saarel laululava laienduse pidulik avamine, kus osalesid nii kohalikud elanikud kui ka kõrged ametnikud, sealhulgas siseminister Lauri Läänemets ja vallavanem Illar Lemetti. Sündmus märgistas vana paadikuuri asukohale rajatud uue laululava valmimist, mis on kiiresti saanud kogukonna seas populaarseks kooskäimiskohaks. Rahvamaja juhataja Külli Talmar-Kuiv tänas kõiki projektiga seotud inimesi. Uus laululava on suviste ürituste raames tõestanud end armastatud peopaigana, mille kogukond on soojalt vastu võtnud.',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, Vihmane,', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '5.5 m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '14.04.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Kohatu jaanitule laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '7.2', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '5.8', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '1, 50cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id, '', false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, tuulevaikne', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '29.04.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Maidla külakeskuse laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '8.8', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '4.9', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id,
                '2 platvormi astet laval, kõrgus 2x17cm, 2 trepiastet, kõrgus 10cm ja 15cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id, '', false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, tuulevaikne', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '29.04.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Jõgisoo Seltsimaja laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '5.65', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '2.55', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '4, 25cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '1948', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                '20. juunil 1948 toimus Jõgisoo rahvamaja juures Saue valla laulupäev, milleks ehitati eraldi laululava. Laulupäevakomisjoni juhtimisel valmistusid Jõgisoo ja Ääsmäe rahvamajades nii sega- kui naiskoorid. Samuti on tegid ettevalmistusi rahvatantsugrupp, Eglase ja Väljari juhtimisel. Esinesid ka ühendatud õpilaskoorid ning külalistena saabusid Hageri ühendatud koorid ja Rakvere teatri kollektiiv, kes esitas H. Raudsepa näidendit "Tillereinu peremehed"',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge/Kuiv tuulevaikne', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '27.04.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Märjamaa laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '12.2', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '5', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '5, 35cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id, '23. ja 24. juunil 1956 toimus Märjamaa lauluväljakul rajooni noorsoofestival, mis ületas oma suuruselt varasemaid rajooni laulupäevi. Festivalil osales üle 40 isetegevuskollektiivi, kokku enam kui 600 laulja, mängija ja tantsijaga. Üritusest võttis osa üle kolme tuhande pealtvaataja. Lisaks kohalikele esinejatele astusid üles ka külaliskollektiivid, nagu Vabariikliku Tööjõureservide Ansambel, Haridustööliste Ametiühingu naiskoor Tallinnast ja Vigala puhkpilliorkester. Festival kestis kaks päeva ning selle ettevalmistused ja edukas läbiviimine tõstsid nii osalejate kunstilisi võimeid kui ka tööinnu rajooni töötajates, suunates neid parematele saavutustele tootmistöös. Festival andis isetegevuskollektiividele uut hoogu ja inspiratsiooni järgnevate sündmuste korraldamiseks.
7. veebruaril 2001 aastal avaldatud artiklis käsitleti Märjamaa lauluväljaku arenguplaane. Märjamaa alevivolikogu oli detsembris eelneval aastal kehtestanud alevi üldplaneeringu, mis määras lauluväljaku ja seda ümbritseva pargi-metsaala puhkerajatiste alaks. See on ette nähtud suviste ürituste, nagu maakonna laulu- ja tantsupidu, korraldamiseks. Lauluväljak asub endistel Oti talu maadel. Lisaks oli kavas lauluväljakut täiustada uue alajaama, elektrivarustuse, valgustuse, parema tantsupõranda, istepinkide ja tualettruumidega.',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge/Kuiv tuulevaikne', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '27.04.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Haimre laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '5', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '3', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '1, 15cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                '2015. aasta juunis valmis Haimre rahvamaja pargis uus tantsupõrand tänu kogukonna ühisele pingutusele ja annetustele. Algatus tuli külavanem Mati Terestali, Ruttar Marrandi ja Margus Jago-Jaagu poolt. Kuigi esialgne projekt "Tantsupõrand külaplatsile" jäi rahastamata ja teine kord jäi projekt arvestusest välja, ei takistanud see kogukonda. Tantsupõrand ehitati nelja talgupäeva jooksul, kus osales ligi kakskümmend inimest, kaasa arvatud naisi. Ehituseks kasutati kogukonna liikmemaksudest ja annetustest kogutud rahalisi vahendeid, sealhulgas immutatud saematerjali Paliverest ja alustööde materjale Jatsi poest. Annetused koguti nii suuliselt kui ka annetuspudelisse. Laululava sisemus on värvitud Märjamaa-kandi triibuseeliku toonides ja koos uue tantsupõrandaga loodetakse elavdada suveürituste korraldamist.',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge/Kuiv tuulevaikne', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '27.04.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Kõltsu mõisapargi laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '7.12', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '6.37', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '3, 30cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                'Kõltsu mõisas on esinenud Laura Põldvere & Band, Tõnis Mägi ja Riho Sibul, Raul Vaigla Quartet koos Marie M. Vaigla ja trio Sooäär-Vaigla-Ruben „1980”, Saara Kadak ja Kõrsikud, Alion Baltic rahvusvahelise muusikafestivali solistid ning Orthodox Singers. Puidust kõlakojas saab korraldada kontserte ning istekohti on viiesajale inimesele.',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge, kuiv', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '27.04.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Kolga-Aabla laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '9.5', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '6', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '0', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id, 'MTÜ Kolga-Aabla Külaselts taotles 2010 aastal PRIA kaudu külaelu arendamise meetmest toetusraha tantsuplatsi kordategemiseks. Suve alguses otsustati PRIAs, et MTÜ saab küsitud summa – 937 796 krooni. MTÜ juhatuse liige Mait Kröönström rääkis, et selle raha eest on kavas teha korda Kolga-Aabla tantsuplats ja lava, WCd ning istepingid varjualustega, laste mänguväljak, küla kiik, vahetada välja publiku pingid, rajada platsile ümber aed.
2011 aastal tehti PRIA toetusega korda  tantsuplats ja lava, rajati laste mänguväljak ja külakiik, kaks WCd, varjualustega istepingid, pandi platsi ümber aed ning vahetati välja publiku pingid.
Külaplatsile on rajatud kiigeplats, spordiplatsid, lõkkeplats, mängimiskoht väikelastele ning varjualusega istumiskohad vanematele inimestele. Lisaks sellele on ehitatud välja varjualusega lava külalisesinejatele ning tantsuplats jalakeerutajatele. Vabaõhulava on suvise aja peamisi noorte vaba aja veetmise kohti.
Organiseerida on seal võimalik kontserte ja muid vahvaid üritusi ümberkaudsetele elanikele ja suvitajatele.', false,
                NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge, kuiv', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '11m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '05.05.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Kihelkonna laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '18.35', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '3.60', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '9, kõrgus 15 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '1986', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, 'Arhitekt Toomas Kivi', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                'Kihelkonna laululaval on toimunud mitmeid maakondlikke laulupidusid ja traditsiooniks on saanud ka Talveöölaulupeod, kus külaliskooride koosseisudes mitmeid ulgu-kihelkondlasi.',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, kuiv', false, NOW(), NOW()),
               (selected_stage_id, wind_id, 'kagutuul 7-13 m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '02.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Taritu kõlakoda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '7.46', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '4.75', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '1, kõrgus 20 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2017?', false, NOW(), NOW()),
               (selected_stage_id, built_by_id,
                'arhitektid Tarmo Laht, Veiko Valge OÜ-st Alver Arhitektid, Saarte koostöökogu esindaja Terje Aus, AS Kuressaare Ehitus (juhataja Tõnu Toompuu, objektijuht Toivo Prostang)',
                false, NOW(), NOW()),
               (selected_stage_id, history_id, 'Taritu ja Lümanda kandis on lauldud ja hõisatud juba üle sajandi. Nimelt tähistas Taritu segakoor maikuus oma 100. tegutsemisaastat ja Lümanda segakoor saab järgmisel aastal 105-aastaseks.

Tulevikus saab tähistada veel üht päeva – 17. novembrit kui Taritu uue laululava avamise päeva. Lindilõikamisele palus Taritu arenguseltsi juhatuse liige Jaanus Reede maavanem Kaido Kaasiku, Lümanda vallavanema Jaanika Tiitsoni ja arenguseltsi esimehe Aili Salongi.

"Kuus aastat tagasi seadsid arenguselts ja koorirahvas endale eesmärgiks, et laululava peab saama. Ühisüritused, laulud ja emotsioonid on need, mis liidavad inimesi, mis aitavad elus edasi, kui on raske, ja on toeks ka siis, kui hing hõiskab ja kõigil hästi läheb," mõtiskles laululava avamisel rahvamaja juht Aili Salong, seistes maakonna laulukooride päevast osavõtjate ees. "Nüüd on ta valmis ja meie siiras tänu kõigile!"
', false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge ja kuiv', false, NOW(), NOW()),
               (selected_stage_id, wind_id, 'kagutuul 6-11 m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '03.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Tõhela laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '6.84', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '3.24', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '1, kõrgus 37 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2006', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, 'Projekteerija Fie Valvo Volgerad', false, NOW(), NOW()),
               (selected_stage_id, history_id, 'Laululava ehituse pildigalerii: http://tohela.ee/pildid/Laululavaehitus/index.html
Laululava ehitati kohaliku kogukonna ja MTÜ Tõhela Külaseltsi ühisel ettevõtmisel. Tõhela rahvamaja FB lehel on kirjas, et tegemist on laululava-grillikojaga, kus saab mõnusalt istuda ja üritusi korraldada.',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge, kuiv', false, NOW(), NOW()),
               (selected_stage_id, wind_id, 'tuulevaikne', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '10.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Mustjala kõlakoda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '9.35', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '5.63', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '2, kõrgus 20 cm ja 30 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '11.10.2014', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, 'Ehitaja Puitkatused OÜ', false, NOW(), NOW()),
               (selected_stage_id, history_id, 'Kõlakoja rajamise projekti juhtis 2010. aastal loodud MTÜ Mustjala Külaselts, mille liige vallavanem ise on. Projekti eestvedajana tõstis Kalle Kolter esile külaseltsi juhatuse liiget Mait Põldu. Kõlakoja ehitas Puitkatused OÜ, kujunduse idee autor oli skulptor Mati Karmin, kes oma suved Mustjalas veedab. Karmini ideele toetudes tehti projekt valmis ettevõttes Kuressaare Kommunaalprojekt OÜ. Draakonipea autor on kohalik kunsti- ja ehitusmees Peeter Metsrand.
Vallavanema sõnul sümboliseerib draakonipea võimsust ja valmisolekut ohtudele vastu seista, viikingilaeva vööri kujuline kõlakoda aga seda, et Mustjala vald asub mere ääres. Kolteri meelest on kõlakoda hästi õnnestunud ja vajalik ehitis.
Nüüd on ka Mustjala muusikafestivalil üks kontserdikoht juures, märkis ta.

September 2020 – Mustjala kõlakoda sai uue renoveeritud põranda. Endine laudpõrand jäi ajale jalgu ja loodus tegi oma töö – oli pehkinud ja muutus ohtlikuks. Välja vahetati kogu puidust põrand 10x15m ning ehitati uus lihvitud betoonpõrand ja nagu ehitaja ütleb “kopteripind”. Laulava põrand on nüüd kapitaalselt ehitatud ja peab vastu muretult aastakümneid. Kulud kandis Saaremaa vald ja ehitas hanke korras Spetsiaalne OÜ. Lisaks vahetatakse välja kõlakoja valguslambid ning paigaldatakse videovalve. Head kasutamist! Kalle Kolter',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge, kuiv', false, NOW(), NOW()),
               (selected_stage_id, wind_id, 'kagutuul 5-9 m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '03.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Tudu laulu koda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '7.44', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '5,00', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '3, kõrgus 20 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2015', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id, 'Tudu laulukoda tehti korda aastal 2015. Laulukoja kordategemisse panustasid MTÜ Tudu Jahiühistu ja Tudu lapsed ohtralt vabatahtlikku tööd. Lapsed kraapisid laulukojalt vana värvi maha, pintseldasid nii laulukoja kui uhiuued pingid värviga üle ning tegid korda tantsuplatsigi.
Mõisapargis asuvas laulukojas toimuvad mitmed suve tähtsaimad sündmused: jaaniõhtu, kooli kokkutulek ja triatlon. Need on Tudu kogukonna liikmeid ühendavad sündmused, mis toovad suviti Tudusse koju käima sealt mujale läinud inimesed ja palju külalisi kaugemaltki.
', false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, vihmane', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '16 m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '17.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Turba kultuurimaja välilava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '9.80', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '5,45', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '3, kõrgus 21 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2023', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id, 'Suvel kontsert-pikniku paigaks suurepärane lava. https://www.facebook.com/watch/?v=353468672789771 (videos veel vana lava) Lauri Liiv kommenteeris:” Laval on elu jooksul tulnud ette igasuguseid olukordi, aga seda, et alajaama lõhki laulan, see on küll üsna erandlik. Täna täpselt niiviisi läks. Olime oma tuuriga "Kolm meest, naine ja 90ndad" esinemas Turba kultuurimaja õuel. Parasjagu laulsin just kontserdi eelviimast lugu "Mis maa see on" ja täpselt laulu kulminatsiooni hetkel kui röökisin kogu hingest fraasi "mis maa see on?!" kostus taamalt vali kärgatus.
Kusagilt paistis tossu ja saime aru et elekter on kadunud. Seega  jäi laul pooleli ja ei saanudki keegi teada, et mis maa see ikkagi siis oli. Hüppasime kogu kambaga lavalt lavaesisele ja esitasime ühiselt koos publikust koosneva taustakooriga veel viimase pala, "Ta lendab mesipuu" poole ja oligi kõik. Ehk et kui senini kuulus teadaolevalt millegi lõhkilaulmise rekord maestro Zahharovile, kes on oma võimsa häälega mitmed mikrofonid purustanud, siis nüüd kuulub see vaieldamatult mulle.  Edaspidi ootan teietamist ja oldagu aupaklikumad! https://www.postimees.ee/7276121/fotod-turbas-poles-alajaam-elektrita-oli-ule-1000-majapidamise?fbclid=IwZXh0bgNhZW0CMTEAAR1jSP8YkbTRqszaDRhEvo5alWwXvpbsNIMUglabCsVOzQLax_mhOLAwfE8_aem_AZ-7n0oTSUZVQoteuy8LEbe8py5yyoncLpLOnwRLDrCDjhlMNk4jEdnfeNoPlhTBPNhqE-kqZ4Bp_gwYLB0S7dXr', false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, kuiv', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '3-6 m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '31.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Oela laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '12', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '5,3', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '1, kõrgus 80 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id, '', false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge, kuiv', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '4m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '07.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Naistevalla';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id, 'Lava eksisteerib veel vaid projektina', false, NOW(), NOW()),
               (selected_stage_id, weather_id, '', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '06.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Aegviidu kõlakoda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '10,2', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '6,1', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '2, kõrgus 32 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                'Aegviidu kõlakoja pargis asub ka madalseikluspark, lastemänguväljak ning rula- ja tõuksi rämp. Kõlakoja pargis toimuvad matkafestivalid ning teised vabaõhuüritused. Aegviidu kõlakojale tehti 2013. aastal Teeme ära talgute raames remont ja värskendus  (https://maaleht.delfi.ee/artikkel/66091452/aegviidu-kolakoda-sai-talgute-korras-varskendust). Aegviidu kõlakojas tähistatakse ka Aegviidu jaanipäeva koos jaanitulega. ',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, tuulevaikne', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '25.04.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Tõstamaa';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '10,66', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '5,61', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '1, kõrgus 30 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '1991', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id, 'Tõstamaa kogukonnaorganisatsiooni FB leht: https://www.facebook.com/tostamaaosavald
Märge laululava ehituse kohta: https://mois.tostamaa.ee/tostamaa-lood/tostamaa-ajalugu-2/tostamaa-ajalugu-2/
1991 Lõppes Tõstamaa kiriku esialgne taastamine. Torn ootab tegijaid.
Valmis praegune laululava. Tõstamaal peeti Pärnumaa folkloorifestival.
mont ja värskendus  (https://maaleht.delfi.ee/artikkel/66091452/aegviidu-kolakoda-sai-talgute-korras-varskendust). Aegviidu kõlakojas tähistatakse ka Aegviidu jaanipäeva koos jaanitulega. ',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge, kuiv, tuulevaikne ', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '10.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Valtu vabaõhulava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '5,63', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '2,67', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '1, kõrgus 16 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id, '', false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Vihmane', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '15m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '14.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Hiiu kõlakoda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '5,0', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '2,2', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '1, kõrgus 20 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2005', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, 'arhitekt Liina Tammaru', false, NOW(), NOW()),
               (selected_stage_id, history_id, 'On olemas ka istepingid kuni sajale pealtvaatajale.Kõlakoja lava põrand on tehtud betoonist, mis võimaldab korraldada väga erinevaid rahvaüritusi. Käbi kujuline metsalava on inspireeritud Nõmme sümbolist männikäbist ja rõhutab oma naturaalse vormiga just Nõmme eripära. Lava koosneb omavahel ühendatud puiduga kaetud “soomustest”, moodustades suurepärase akustikaga kõlakoja. See on Nõmme sõlmpunktiga, kuhu saavad sõbrad ja pered kokku tulla ning koos aega veeta.Tänaseks on kõlakojas maha peetud ka juba mitu laulu- ning tantsuüritused.
Näiteks 2018.aastal toimus Nõmme IV  laulu- ja tantsupäev. Nõmme laulupäeva tähistati Nõmme linnas aastal 1926–1934 iga nelja aasta tagant suvel. Traditsiooni taaselustasid ja täiendasid tantsukavaga 2018. aastal. Pärast korraldati ka Nõmme V laulu- ja tantsupäev motoga "Nõmme läbi aegade", mis toimus 2022.aastal.
', false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge, kuiv', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '9m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '14.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Aegviidu kõlakoda';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '10,2', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '6,1', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '2, kõrgus 32 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id, 'Aegviidu kõlakoja pargis asub ka madalseikluspark, lastemänguväljak ning rula- ja tõuksi rämp. Kõlakoja pargis toimuvad matkafestivalid ning teised vabaõhuüritused. Aegviidu kõlakojale tehti 2013. aastal Teeme ära talgute raames remont ja värskendus  (https://maaleht.delfi.ee/artikkel/66091452/aegviidu-kolakoda-sai-talgute-korras-varskendust). Aegviidu kõlakojas tähistatakse ka Aegviidu jaanipäeva koos jaanitulega.
', false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, tuulevaikne', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '25.04.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Keila väike laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '11,8', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '4,6', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '7, kaldteega platvorm 80 cm, astmed 6x 25 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '2024', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, 'Molumba arhitektuuribüroo, ehitaja RTS Infra', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                'Keila lauluväljaku arhitektiks on Johan Tali. Keila lauluväljakul on kasutatud looduslähedasi lahendusi (bambuspingid, ilmajaam, looduspõhised sademeveelahendused,päikeseenergial töötavad väikevormid ja palju muud). Keila lauluväljaku hoonetel ja karikatustel on haljaskatused ja lava ümbritseb talvel uisuväljak. Lauluväljaku esimeseks suuremaks sündmuseks saab olema Harjumaa laulu- ja tantsupidu MEIE VÄGI 7.-9. juunil 2024. Väikese lava juures on tribüün 300 inimesele. Lava avaneb lõunasuunas.',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, kuiv', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '12m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '25.04.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Keila suur laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '22,0', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '10,2', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '7, kaldteega platvorm 80 cm, astmed 6 x 25 cm', false, NOW(),
                NOW()),
               (selected_stage_id, built_when_id, '2024', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, 'Molumba arhitektuuribüroo, ehitaja RTS Infra', false, NOW(), NOW()),
               (selected_stage_id, history_id,
                'Keila lauluväljaku arhitektiks on Johan Tali. Keila lauluväljakul on kasutatud looduslähedasi lahendusi (bambuspingid, ilmajaam, looduspõhised sademeveelahendused,päikeseenergial töötavad väikevormid ja palju muud). Keila lauluväljaku hoonetel ja karikatustel on haljaskatused ja lava ümbritseb talvel uisuväljak. Lauluväljaku esimeseks suuremaks sündmuseks saab olema Harjumaa laulu- ja tantsupidu MEIE VÄGI 7.-9. juunil 2024. Suure lava juures on tribüün 1500 inimesele. Lava avaneb põhjasuunas.',
                false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Pilvine, kuiv', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '12m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '25.04.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Kodila laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '12,0', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '7,0', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '1, aste 35 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id, '', false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge, kuiv', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '4m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '7.03.2024', false, NOW(), NOW());

        SELECT id INTO selected_stage_id FROM stage WHERE name = 'Vana-Vigala laululava';
        INSERT INTO stage_data (stage_id, stage_data_type_id, value, deleted, created, edited)
        VALUES (selected_stage_id, width_id, '11,40', false, NOW(), NOW()),
               (selected_stage_id, depth_id, '6,0', false, NOW(), NOW()),
               (selected_stage_id, step_amount_id, '3, aste 20 cm', false, NOW(), NOW()),
               (selected_stage_id, built_when_id, '', false, NOW(), NOW()),
               (selected_stage_id, built_by_id, '', false, NOW(), NOW()),
               (selected_stage_id, history_id, '', false, NOW(), NOW()),
               (selected_stage_id, weather_id, 'Selge, kuiv', false, NOW(), NOW()),
               (selected_stage_id, wind_id, '1m/s', false, NOW(), NOW()),
               (selected_stage_id, measure_date_id, '6.03.2024', false, NOW(), NOW());
    END;
$$;