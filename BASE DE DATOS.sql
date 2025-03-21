PGDMP  0                    }            Citas    17.3    17.3 $    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16450    Citas    DATABASE     m   CREATE DATABASE "Citas" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-CO';
    DROP DATABASE "Citas";
                     postgres    false            �            1259    16471    disponibilidad    TABLE     �   CREATE TABLE public.disponibilidad (
    id integer NOT NULL,
    servicio_id integer,
    dia character varying(20) NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL
);
 "   DROP TABLE public.disponibilidad;
       public         heap r       postgres    false            �            1259    16470    disponibilidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.disponibilidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.disponibilidad_id_seq;
       public               postgres    false    222            �           0    0    disponibilidad_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.disponibilidad_id_seq OWNED BY public.disponibilidad.id;
          public               postgres    false    221            �            1259    16483    reservas    TABLE     �   CREATE TABLE public.reservas (
    id integer NOT NULL,
    usuario_id integer,
    servicio_id integer,
    fecha date NOT NULL,
    hora time without time zone NOT NULL
);
    DROP TABLE public.reservas;
       public         heap r       postgres    false            �            1259    16482    reservas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reservas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.reservas_id_seq;
       public               postgres    false    224            �           0    0    reservas_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.reservas_id_seq OWNED BY public.reservas.id;
          public               postgres    false    223            �            1259    16462 	   servicios    TABLE     �   CREATE TABLE public.servicios (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    duracion integer NOT NULL
);
    DROP TABLE public.servicios;
       public         heap r       postgres    false            �            1259    16461    servicios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.servicios_id_seq;
       public               postgres    false    220            �           0    0    servicios_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.servicios_id_seq OWNED BY public.servicios.id;
          public               postgres    false    219            �            1259    16452    usuarios    TABLE     h  CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    telefono character varying(15),
    rol character varying(50) NOT NULL,
    CONSTRAINT usuarios_rol_check CHECK (((rol)::text = ANY ((ARRAY['cliente'::character varying, 'admin'::character varying])::text[])))
);
    DROP TABLE public.usuarios;
       public         heap r       postgres    false            �            1259    16451    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public               postgres    false    218            �           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public               postgres    false    217            2           2604    16474    disponibilidad id    DEFAULT     v   ALTER TABLE ONLY public.disponibilidad ALTER COLUMN id SET DEFAULT nextval('public.disponibilidad_id_seq'::regclass);
 @   ALTER TABLE public.disponibilidad ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            3           2604    16486    reservas id    DEFAULT     j   ALTER TABLE ONLY public.reservas ALTER COLUMN id SET DEFAULT nextval('public.reservas_id_seq'::regclass);
 :   ALTER TABLE public.reservas ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    224    224            1           2604    16465    servicios id    DEFAULT     l   ALTER TABLE ONLY public.servicios ALTER COLUMN id SET DEFAULT nextval('public.servicios_id_seq'::regclass);
 ;   ALTER TABLE public.servicios ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            0           2604    16455    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �          0    16471    disponibilidad 
   TABLE DATA           U   COPY public.disponibilidad (id, servicio_id, dia, hora_inicio, hora_fin) FROM stdin;
    public               postgres    false    222   �)       �          0    16483    reservas 
   TABLE DATA           L   COPY public.reservas (id, usuario_id, servicio_id, fecha, hora) FROM stdin;
    public               postgres    false    224   �)       �          0    16462 	   servicios 
   TABLE DATA           F   COPY public.servicios (id, nombre, descripcion, duracion) FROM stdin;
    public               postgres    false    220    *       �          0    16452    usuarios 
   TABLE DATA           D   COPY public.usuarios (id, nombre, email, telefono, rol) FROM stdin;
    public               postgres    false    218   �*       �           0    0    disponibilidad_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.disponibilidad_id_seq', 2, true);
          public               postgres    false    221            �           0    0    reservas_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.reservas_id_seq', 2, true);
          public               postgres    false    223            �           0    0    servicios_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.servicios_id_seq', 2, true);
          public               postgres    false    219            �           0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 2, true);
          public               postgres    false    217            <           2606    16476 "   disponibilidad disponibilidad_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.disponibilidad
    ADD CONSTRAINT disponibilidad_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.disponibilidad DROP CONSTRAINT disponibilidad_pkey;
       public                 postgres    false    222            >           2606    16488    reservas reservas_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.reservas DROP CONSTRAINT reservas_pkey;
       public                 postgres    false    224            :           2606    16469    servicios servicios_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT servicios_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.servicios DROP CONSTRAINT servicios_pkey;
       public                 postgres    false    220            6           2606    16460    usuarios usuarios_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_email_key;
       public                 postgres    false    218            8           2606    16458    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public                 postgres    false    218            ?           2606    16477 .   disponibilidad disponibilidad_servicio_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.disponibilidad
    ADD CONSTRAINT disponibilidad_servicio_id_fkey FOREIGN KEY (servicio_id) REFERENCES public.servicios(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.disponibilidad DROP CONSTRAINT disponibilidad_servicio_id_fkey;
       public               postgres    false    220    222    4666            @           2606    16494 "   reservas reservas_servicio_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_servicio_id_fkey FOREIGN KEY (servicio_id) REFERENCES public.servicios(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.reservas DROP CONSTRAINT reservas_servicio_id_fkey;
       public               postgres    false    220    4666    224            A           2606    16489 !   reservas reservas_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.reservas DROP CONSTRAINT reservas_usuario_id_fkey;
       public               postgres    false    218    4664    224            �   4   x�3�4��)�K-�4��20 "NCs�ˈӈ�7��(ih ���J��qqq ���      �   1   x�3�4B##S]c]#NC+c+.#�8B��(������ 
�	/      �   m   x�3�t�/*IUHIUpNLJ���G$C
�2�s��R�rK�R�8���8}��R�Rs��JR9�S�3o�i΅���@bf
��y�%�Ŝf\1z\\\ �K*O      �   `   x�3��*M�S8��(��3�vH�H�-�I�K���4426153��4�L��L�+I�2�t�KTp?�9�!1/E����������!gbJnfW� �5s     