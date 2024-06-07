PGDMP  '             
        |            Turma_A    16.1    16.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16450    Turma_A    DATABASE     �   CREATE DATABASE "Turma_A" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "Turma_A";
                postgres    false            �            1259    18465    agencia    TABLE     �   CREATE TABLE public.agencia (
    endereco character varying(255) NOT NULL,
    cidade character varying(255) NOT NULL,
    num_agencia integer NOT NULL,
    estado character varying(2) NOT NULL,
    contato character varying(11) NOT NULL
);
    DROP TABLE public.agencia;
       public         heap    postgres    false            �            1259    18477    carro    TABLE     8  CREATE TABLE public.carro (
    modelo character varying(25),
    ano integer,
    id_carro integer NOT NULL,
    placa character varying(7) NOT NULL,
    tipo character varying(25),
    disponibilidade boolean NOT NULL,
    preco_aluguel money,
    marca character varying(50),
    status_manutencao boolean
);
    DROP TABLE public.carro;
       public         heap    postgres    false            �            1259    18489    cliente    TABLE     �  CREATE TABLE public.cliente (
    endereco character varying(255) NOT NULL,
    id_cliente integer NOT NULL,
    cidade character varying(255) NOT NULL,
    email character varying(100) NOT NULL,
    nome character varying(125) NOT NULL,
    sobrenome character varying(125) NOT NULL,
    estado character varying(2) NOT NULL,
    celular character varying(11) NOT NULL,
    id_pagamento integer
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    18539    envia    TABLE     �   CREATE TABLE public.envia (
    id_envio integer NOT NULL,
    observacao character varying(255),
    id_feedback integer,
    id_cliente integer
);
    DROP TABLE public.envia;
       public         heap    postgres    false            �            1259    18506    feedback    TABLE     �   CREATE TABLE public.feedback (
    id_feedback integer NOT NULL,
    avaliacao integer,
    comentario character varying(255),
    data_feedback date
);
    DROP TABLE public.feedback;
       public         heap    postgres    false            �            1259    18496    funcionarios    TABLE     I  CREATE TABLE public.funcionarios (
    nome character varying(125) NOT NULL,
    cargo character varying(50) NOT NULL,
    id_funcionario integer NOT NULL,
    sobrenome character varying(125) NOT NULL,
    data_contratacao date NOT NULL,
    salario money NOT NULL,
    num_agencia integer,
    cidade character varying(255)
);
     DROP TABLE public.funcionarios;
       public         heap    postgres    false            �            1259    18511    locacao    TABLE     �   CREATE TABLE public.locacao (
    id_locacao integer NOT NULL,
    data_locacao date NOT NULL,
    valor_total money NOT NULL,
    data_devolucao date NOT NULL,
    id_cliente integer,
    id_carro integer
);
    DROP TABLE public.locacao;
       public         heap    postgres    false            �            1259    18482 
   manutencao    TABLE     �   CREATE TABLE public.manutencao (
    km numeric NOT NULL,
    custo money NOT NULL,
    tipo_manutencao character varying(100) NOT NULL,
    id_manutencao integer NOT NULL,
    descricao character varying(255) NOT NULL,
    manutencao date NOT NULL
);
    DROP TABLE public.manutencao;
       public         heap    postgres    false            �            1259    18472 	   pagamento    TABLE     8  CREATE TABLE public.pagamento (
    valor money NOT NULL,
    data_pagamento date NOT NULL,
    status_pagamento character varying(50) NOT NULL,
    forma_pagamento character varying(100) NOT NULL,
    id_pagamento integer NOT NULL,
    comprovante character varying(255),
    id_comprovante integer NOT NULL
);
    DROP TABLE public.pagamento;
       public         heap    postgres    false            �            1259    18526    recebe    TABLE     P   CREATE TABLE public.recebe (
    id_manutencao integer,
    id_carro integer
);
    DROP TABLE public.recebe;
       public         heap    postgres    false            5           2606    18471    agencia agencia_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.agencia
    ADD CONSTRAINT agencia_pkey PRIMARY KEY (num_agencia);
 >   ALTER TABLE ONLY public.agencia DROP CONSTRAINT agencia_pkey;
       public            postgres    false    216            9           2606    18481    carro carro_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.carro
    ADD CONSTRAINT carro_pkey PRIMARY KEY (id_carro);
 :   ALTER TABLE ONLY public.carro DROP CONSTRAINT carro_pkey;
       public            postgres    false    218            =           2606    18495    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    220            E           2606    18543    envia envia_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.envia
    ADD CONSTRAINT envia_pkey PRIMARY KEY (id_envio);
 :   ALTER TABLE ONLY public.envia DROP CONSTRAINT envia_pkey;
       public            postgres    false    225            A           2606    18510    feedback feedback_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id_feedback);
 @   ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_pkey;
       public            postgres    false    222            ?           2606    18500    funcionarios funcionarios_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (id_funcionario);
 H   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_pkey;
       public            postgres    false    221            C           2606    18515    locacao locacao_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT locacao_pkey PRIMARY KEY (id_locacao);
 >   ALTER TABLE ONLY public.locacao DROP CONSTRAINT locacao_pkey;
       public            postgres    false    223            ;           2606    18488    manutencao manutencao_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.manutencao
    ADD CONSTRAINT manutencao_pkey PRIMARY KEY (id_manutencao);
 D   ALTER TABLE ONLY public.manutencao DROP CONSTRAINT manutencao_pkey;
       public            postgres    false    219            7           2606    18476    pagamento pagamento_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (id_pagamento, id_comprovante);
 B   ALTER TABLE ONLY public.pagamento DROP CONSTRAINT pagamento_pkey;
       public            postgres    false    217    217            K           2606    18544    envia envia_id_feedback_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.envia
    ADD CONSTRAINT envia_id_feedback_fkey FOREIGN KEY (id_feedback) REFERENCES public.feedback(id_feedback);
 F   ALTER TABLE ONLY public.envia DROP CONSTRAINT envia_id_feedback_fkey;
       public          postgres    false    222    4673    225            F           2606    18501 *   funcionarios funcionarios_num_agencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_num_agencia_fkey FOREIGN KEY (num_agencia) REFERENCES public.agencia(num_agencia);
 T   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_num_agencia_fkey;
       public          postgres    false    4661    216    221            G           2606    18516    locacao locacao_id_carro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT locacao_id_carro_fkey FOREIGN KEY (id_carro) REFERENCES public.carro(id_carro);
 G   ALTER TABLE ONLY public.locacao DROP CONSTRAINT locacao_id_carro_fkey;
       public          postgres    false    218    223    4665            H           2606    18521    locacao locacao_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT locacao_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 I   ALTER TABLE ONLY public.locacao DROP CONSTRAINT locacao_id_cliente_fkey;
       public          postgres    false    220    223    4669            I           2606    18534    recebe recebe_id_carro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recebe
    ADD CONSTRAINT recebe_id_carro_fkey FOREIGN KEY (id_carro) REFERENCES public.carro(id_carro);
 E   ALTER TABLE ONLY public.recebe DROP CONSTRAINT recebe_id_carro_fkey;
       public          postgres    false    218    224    4665            J           2606    18529     recebe recebe_id_manutencao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recebe
    ADD CONSTRAINT recebe_id_manutencao_fkey FOREIGN KEY (id_manutencao) REFERENCES public.manutencao(id_manutencao);
 J   ALTER TABLE ONLY public.recebe DROP CONSTRAINT recebe_id_manutencao_fkey;
       public          postgres    false    224    219    4667           