
CREATE TABLE IF NOT EXISTS processing_types
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS users
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(20)  NOT NULL,
    email    VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    CONSTRAINT users_email_unique UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS grind_sizes
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS coffees
(
    id            SERIAL PRIMARY KEY,
    name          TEXT NOT NULL,
    origin        TEXT NOT NULL,
    processing_id BIGINT,
    flavour_notes TEXT,
    rating        INTEGER,
    quantity      DOUBLE PRECISION,

    CONSTRAINT coffees_processing_fk FOREIGN KEY (processing_id) REFERENCES processing_types (id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS brew_types
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS brew_methods
(
    id                SERIAL PRIMARY KEY,
    name              VARCHAR(255)  NOT NULL,
    brew_type_id       BIGINT        NOT NULL,
    recipe            VARCHAR(4000) NOT NULL,
    ratio             INTEGER       NOT NULL,
    grind_size_id      BIGINT,
    water_temperature INTEGER       NOT NULL,
    brew_time         VARCHAR(255)  NOT NULL,
    CONSTRAINT brew_methods_brew_type_fk FOREIGN KEY (brew_type_id) REFERENCES brew_types (id),
    CONSTRAINT brew_methods_grind_size_fk FOREIGN KEY (grind_size_id) REFERENCES grind_sizes (id)
);

CREATE TABLE IF NOT EXISTS coffee_brewtype
(
    coffee_id   BIGINT,
    brewtype_id BIGINT,
    CONSTRAINT coffee_brewtype_coffee_fk FOREIGN KEY (coffee_id) REFERENCES coffees (id) ON DELETE CASCADE,
    CONSTRAINT coffee_brewtype_brewtype_fk FOREIGN KEY (brewtype_id) REFERENCES brew_types (id) ON DELETE CASCADE
);

insert into users (name, email, password)
values ('user@coffee', 'user@coffee.com', 'coffee123');

insert into processing_types (name)
values ('natural'),
       ('washed'),
       ('honey');

INSERT INTO coffees (name, origin, processing_id, flavour_notes, rating, quantity)
VALUES ('Audun Coffee', 'Brazil Fazenda Rainha Miak', 1, 'dark chocolate, plum', 7, 170),
       ('HAYB', 'Boliwia Manco Kapac', 2, 'walnut, cherry, honey', 8, 200),
       ('Coffeelab', 'Salwador San Francisco', 3, 'pomelo, marshmallow', 9, 14),
       ('KawePale', 'Peru La Despreciada', 1, 'red apple, cherry, raspberry', 5, 74),
       ('Coffeelab', 'Kenia', 2, 'caramel, cheesecake', 10, 156);

INSERT INTO brew_types (id, name)
values (1, 'V60'),
       (2, 'Aeropress'),
       (3, 'Chemex'),
       (4, 'Moka pot');

INSERT INTO grind_sizes (name)
values ('Extra fine'),
       ('Fine'),
       ('Medium fine'),
       ('Medium'),
       ('Medium coarse'),
       ('Coarse');

INSERT INTO coffee_brewtype (coffee_id, brewtype_id)
values (1, 1),
       (1, 2),
       (2, 2),
       (2, 3),
       (2, 4),
       (3, 3),
       (3, 1),
       (4, 2),
       (4, 3),
       (4, 4),
       (5, 1),
       (5, 3);

INSERT INTO brew_methods (id, brew_time, name, ratio, recipe, water_temperature, brew_type_id, grind_size_id)
VALUES (1, '3:30', '4 : 6', 15,
        '1. Rinse filter & pre-heat V60' ||E'\n'||
        '2. Pour in ${coffeeGrounds} g of coarse-ground coffee' ||E'\n'||
        '3. Add ${desiredAmount / 5} of water per pour 5 times, waiting 45s between each pour. This results in a total brew of ${desiredAmount}.' ||E'\n'||
        '4. Control the balance of the coffee by modifying the 1st and 2nd pours. For a sweeter brew, make a smaller first pour. For more acidity, a larger one will do the trick.' ||E'\n'||
        '5. Use either less or more water for the second pour to compensate for the difference (if any) in the first one.',
        87, 1, 6),

       (2, '3:30', 'Hoffman’s', 16,
        '1. Rinse filter & pre-heat V60' ||E'\n'||
         '2. Pour in grounds, create well in the middle.' ||E'\n'||
         '3. Pre-wet with ${desiredAmount / 16.6669 * 2} g of water (~2x weight of grounds).' ||E'\n'||
         '4. Swirl brewer until the slurry is even.' ||E'\n'||
         '5. At 45s, complete the first main pour till ${desiredAmount * 0.6} in the next 30s.' ||E'\n'||
         '6. At 1min 15s, gently complete second main pour till ${desiredAmount} in the next 30s.' ||E'\n'||
         '7. Stir gently clockwise and anti-clockwise to kick grounds from the sides' ||E'\n'||
         '8. Gently swirl brewer to flatten coffee bed for even extraction' ||E'\n'||
         '9. Aim to finish drawdown by 3min 30s.', 99, 1, 1),

       (3, '3:00', 'Scott Rao’s', 16,
        '1. Rinse filter & pre-heat V60' ||E'\n'||
           '2. Pour in grounds, flatten, pre-wet with ${desiredAmount / 16.6669 * 3} g of water (~3x weight of grounds).' ||E'\n'||
           '3. Gently excavate to wet all the grounds within 10s' ||E'\n'||
           '4. At 45s, start main pour until ${desiredAmount} g.' ||E'\n'||
           '5. Gently stir to stop grounds from clinging to sides' ||E'\n'||
           '6. At 1min 45s, swirl V60 to flatten coffee bed for even brew' ||E'\n'||
           '7. Drawdown should be complete within 3 minutes.', 93, 1, 4),

       (4, '4:00', 'Intelligentsia', 18,
            '1. Rinse filter & pre-heat V60' ||E'\n'||
          '2. Pour in ${coffeeGrounds} g of coffee (ground to “sand-like” levels)' ||E'\n'||
          '3. Add ${desiredAmount / 16.6669 * 2} g (2x weight of grounds) of water for pre-wetting. Pour in a clockwise spiral outward from the centre. Wait ~1 min.' ||E'\n'||
          '4. Add ${desiredAmount / 6.7}-${desiredAmount / 4.68}g of water a time, waiting 10-12s between pours. Pours should be slow enough that the water falls directly downward, and concentrated in the centre of the coffee bed, moving outward.' ||E'\n'||
          '5. Stop once the target weight is reached, removing the dripper once it reaches an occasional drip.',93, 1, 2),

       (5, '3:00', 'Hario’s', 12,
        '1. Fold filter paper and place on dripper, before rinsing and warming with boiling water.' ||E'\n'||
        '2. Pour in ${coffeeGrounds} g of coffee, shaking the V60 lightly to level the grounds.' ||E'\n'||
        '3. Pour boiling water from the centre of the grounds, spiralling outwards. Let it pre-wet for 30s.' ||E'\n'||
        '4. Pour the rest of the brew with the same spiral motion, taking special care to avoid pouring on the filter paper itself.' ||E'\n'||
        '5. Remove the dripper once your brew is finished.',
        100, 1, 3),

       (6, '1:10', 'Wendelien Van Bunnik', 7,
        '1. Pour ${desiredAmount /2} g of water on the ${coffeeGrounds} g of coffee in 10 seconds.' ||E'\n'||
        '2. Stir firmly for 20 times in 10 seconds.' ||E'\n'||
        '3. Put the filter cap with a rinsed filter on the AeroPress and gently press out excess air.' ||E'\n'||
        '4. At 40 seconds, flip the AeroPress and press out all coffee.' ||E'\n'||
        '5. Add ${desiredAmount /2} g of water to the extracted coffee.' ||E'\n'||
        '6. Cool the brew down to roughly 60°C by stirring and decanting.',
        92, 2, 5),

       (7, '3:00', 'Hoffman’s', 16,
        'Set brewer in standard position on a server. Dont rinse or preheat the brewer (it doesnt make any difference).' ||E'\n'||
        'Start a timer, add ${desiredAmount}mL water, aiming to wet all the coffee during pouring.' ||E'\n'||
        'Then immediately place the plunger on top of the brewer, about 1cm in. This creates a vacuum to stop the coffee from dripping through.' ||E'\n'||
        'Wait 2 minutes.' ||E'\n'||
        'Holding the brewer and the plunger, gently swirl the brewer.' ||E'\n'||
        'Wait 30 seconds.' ||E'\n'||
        'Press gently all the way, it takes about 30 seconds.' ||E'\n'||
        'Drink and enjoy!',
        90, 2, 1),

       (8, '1:30', 'Tim Wendelboe’s', 14,
        'Rinse the paper filter with running tap water for 10 seconds.' ||E'\n'||
        'Use ${coffeeGrounds} grams of freshly fine filter ground coffee.' ||E'\n'||
        'Pour ${desiredAmount}g of water at about 96°C over the coffee.' ||E'\n'||
        'Stir 3 times back to front.' ||E'\n'||
        'Place the handle on the AeroPress in order to prevent the water from draining through the filter.' ||E'\n'||
        'Steep for 60 seconds.' ||E'\n'||
        'After 60 second steep time, take the handle off, stir 3 times back to front...(it’s important to only stir 3 times again here, if you stir less it will be under-extracted, stir more and it will be over-extracted)..' ||E'\n'||
        'Then place the handle on top of the AeroPress and press the coffee into a large cup or pitcher by using your body weight.',
        96, 2, 2),

       (9, '2:30', 'Aeropress for two', 15,
        'Add ${desiredAmount /2} of water rapidly' ||E'\n'||
        'Put down the plunger, and press 1 inch. Let the resistance/back pressure help you push the plunger back up, while pulling the plunger to the side.' ||E'\n'||
        'Reinsert the plunger and follow the same step again.' ||E'\n'||
        'Keep doing this until all water has been forced out. This should take around 45 seconds to 1 minute.' ||E'\n'||
        'Then add ${desiredAmount /2} g of water again. Insert the plunger and pull it up slightly to create a vacuum seal.' ||E'\n'||
        'Wait 1 minute, and press down until you hear a hiss.' ||E'\n'||
        'Enjoy two cups of AeroPress!',
        93, 2, 4),

       (10, '1:30', 'Light roast', 15,
        'Rinse filter with hot water' ||E'\n'||
        'Add coffee, and add all the water quickly' ||E'\n'||
        'No stirring & no bloom' ||E'\n'||
        'Steep for 50 seconds' ||E'\n'||
        'Press for 20 seconds' ||E'\n'||
        'Stop pressing before the hiss',
        99, 2, 2),

       (11, '2:30', 'Smile Tiger Coffee Roasters', 16,
        'Heat the water to 95ºC' ||E'\n'||
        'Pour ${coffeeGrounds * 2} g water over the grounds and stir gently' ||E'\n'||
        'After 30 seconds pour to ${desiredAmount / 2}g of water' ||E'\n'||
        'At the 1:15 minute mark pour until ${desiredAmount * 0.9} ' ||E'\n'||
        'At 2:00 pour the rest of water up to ${desiredAmount} g.',
        95, 3, 3),

       (12, '1:45', 'Brewing is for everyone', 16,
        'Boil the water' ||E'\n'||
        'Rinse the filter thoroughly' ||E'\n'||
        'Grind ${coffeeGrounds} g of coffee on medium' ||E'\n'||
        'Bloom the coffee by pouring ${desiredAmount / 8} g of water' ||E'\n'||
        'Stir the bloom gently' ||E'\n'||
        'Wait 30 seconds' ||E'\n'||
        'Pour slowly up to ${desiredAmount} g total',
        99, 3, 4),

       (13, '2:00', 'Filtru', 14,
        'Heat the water to 94ºC' ||E'\n'||
        'Grind the coffee to a medium consistency' ||E'\n'||
        'Bloom with ${coffeeGrounds * 2} g water' ||E'\n'||
        'Stir the grounds to ensure even wetting' ||E'\n'||
        'Wait 30 seconds\r\nPour another ${desiredAmount / 2.9} g of water' ||E'\n'||
        'Wait for the water to drain completely' ||E'\n'||
        'Slowly pour the rest of water. ' ||E'\n'||
        'Enjoy!',
        94, 3, 4),

       (14, '1:15', 'The Moka Pot Method', 5,
        'Fill the bottom half of your coffee maker with water.' ||E'\n'||
        'Insert the filter basket into the bottom of the pot.' ||E'\n'||
        'Fill the basket with coffee and give it a shake to settle the grounds evenly. Do not tamp the grounds, you want them loose.' ||E'\n'||
        'Screw on the spouted top. Make sure you use a tea towel or oven gloves!' ||E'\n'||
        'Put the brewer on the stove and use moderate heat and leave the top lid open.' ||E'\n'||
        'You’ll start to hear the water boil in the base - at this point, lower the heat! You’ll hear a puffing sound as the coffee oozes out of the spout on the top half. Once the stream of coffee is honey-coloured, remove it from the stove with a tea towel and close the lid.' ||E'\n'||
        'At this point, the coffee will stop bubbling out. Pour it into your favourite mug and enjoy!',
        100, 4, 3);