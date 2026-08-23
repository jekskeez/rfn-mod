package §_-l2u§
{
   import §_-ZL§.§_-QO§;
   import §_-ZL§.§_-n2g§;
   import §_-bN§.Dialog;
   import §_-bN§.§_-Fk§;
   
   public class §_-CD§
   {
      
      public static const §_-bT§:String = "required";
      
      public static const §_-G2C§:String = "forbidden";
      
      public static const §_-b2s§:String = "requiredBattle";
      
      public static const §_-o2§:String = "forbiddenBattle";
      
      public static const §_-12G§:String = "requiredDragons";
      
      public static const §_-Ou§:String = "forbiddenDragons";
      
      public static const §_-mj§:String = "requiredTwoShamans";
      
      public static const §_-Q27§:String = "forbiddenTwoShamans";
      
      public static const §_-u7§:String = "requiredSurvival";
      
      public static const §_-df§:String = "forbiddenSurvival";
      
      public static const §_-k1m§:String = "forbiddenRoped";
      
      public static const §_-62m§:String = "requiredFlyAcorn";
      
      public static const §_-D6§:String = "forbiddenFlyAcorn";
      
      public static const §_-z1§:String = "requiredZombie";
      
      public static const §_-T1i§:String = "requiredVolcano";
      
      private static const §_-l29§:String = gls("Cохранить карту");
      
      private static const §_-E1E§:Object = {
         "required":gls("Сохранить карту нельзя,\nт.к. на карте должны присутствовать\nорех, обычное дупло, белка и шаман."),
         "requiredBattle":gls("Сохранить карту нельзя,\nт.к. на карте должны присутствовать\nядро, белка и шаман для каждой команды."),
         "requiredDragons":gls("Сохранить карту нельзя,\nт.к. на карте должны присутствовать\nорех, дупло и белка."),
         "requiredTwoShamans":gls("Сохранить карту нельзя,\nт.к. на карте должны присутствовать\nорех, белка, одно красное и одно\nсинее дупло, красный и синий шаман."),
         "requiredSurvival":gls("Сохранить карту нельзя,\nт.к. на карте должны присутствовать\nбелка и чёрный шаман."),
         "requiredFlyAcorn":gls("Сохранить карту нельзя,\nт.к. на карте должны присутствовать\nорех, дупло и маршрут полета ореха"),
         "requiredZombie":gls("Сохранить карту нельзя,\nт.к. на карте должны присутствовать\nбелка и зомби."),
         "requiredVolcano":gls("Сохранить карту нельзя,\nт.к. на карте должна присутствовать\nбелка.")
      };
      
      private static const §_-p2e§:Object = {
         "forbidden":gls("Сохранить карту нельзя,\nт.к. на карте не должны присутствовать\nобъекты битвы и других режимов игры."),
         "forbiddenBattle":gls("Сохранить карту нельзя,\nт.к. на карте не должны присутствовать\nобъекты других режимов игры,\nорех и дупло."),
         "forbiddenDragons":gls("Сохранить карту нельзя,\nт.к. на карте не должны присутствовать\nшаман, объекты битвы и других\nрежимов игры."),
         "forbiddenRoped":gls("Сохранить карту нельзя,\nт.к. на карте не должны присутствовать\nобъекты битвы и других режимов,\nа количество белок не должно превышать 2.\nРасстояние между белками\nдолжно быть небольшим."),
         "forbiddenTwoShamans":gls("Сохранить карту нельзя,\nт.к. на карте не должны присутствовать\nобъекты битвы и других режимов игры."),
         "forbiddenSurvival":gls("Сохранить карту нельзя,\nт.к. на карте не должны присутствовать\nорех, дупло, объекты битвы и других\nрежимов игры."),
         "forbiddenFlyAcorn":gls("Сохранить карту нельзя,\nт.к. у вас есть точка маршрута и к ней ничего не привязано")
      };
      
      private var §_-b2w§:§_-Fk§;
      
      private var §_-l2G§:§_-Fk§;
      
      private var exit:§_-n2g§;
      
      private var §_-p12§:§_-QO§;
      
      private var §_-21P§:§_-Fk§;
      
      private var §_-8y§:§_-Fk§;
      
      private var §_-j1L§:Function;
      
      private var §_-d2h§:Function;
      
      private var §_-Z1N§:Function;
      
      private var §_-027§:Function;
      
      private var §_-x2I§:Function;
      
      private var §_-72I§:Function;
      
      public function §_-CD§(param1:Function, param2:Function, param3:Function, param4:Function, param5:Function, param6:Function)
      {
         super();
         this.§_-j1L§ = param1;
         this.§_-d2h§ = param2;
         this.§_-Z1N§ = param3;
         this.§_-027§ = param4;
         this.§_-x2I§ = param5;
         this.§_-72I§ = param6;
      }
      
      public function §_-xe§(param1:String) : void
      {
         this.§_-k3§(§_-E1E§[param1]);
      }
      
      public function §_-fL§(param1:String) : void
      {
         this.§_-k3§(§_-p2e§[param1]);
      }
      
      public function §_-N2E§() : void
      {
         if(!this.§_-b2w§)
         {
            this.§_-b2w§ = new §_-Fk§(gls("Удаление карты"),gls("Ты уверен, что хочешь удалить карту?"),true,this.§_-j1L§,0,null,false);
         }
         this.§_-b2w§.show();
      }
      
      public function §_-zZ§() : void
      {
         if(!this.§_-l2G§)
         {
            this.§_-l2G§ = new §_-Fk§(gls("Сохранение карты"),gls("Протестируйте карту перед отправкой"));
         }
         this.§_-l2G§.show();
      }
      
      public function §_-F1n§() : void
      {
         if(!this.exit)
         {
            this.exit = new §_-n2g§(this.§_-027§,this.§_-x2I§,this.§_-72I§);
         }
         this.exit.show();
      }
      
      public function §_-X2t§() : void
      {
         if(!this.§_-p12§)
         {
            this.§_-p12§ = new §_-QO§(this.§_-Z1N§,this.§_-d2h§);
         }
         this.§_-p12§.show();
      }
      
      public function §_-J1B§() : void
      {
         if(!this.§_-21P§)
         {
            this.§_-21P§ = new §_-Fk§(gls("Сохранить карту"),gls("У тебя недостаточно прав для сохранения этой карты в другой локации."));
         }
         this.§_-21P§.show();
      }
      
      public function §_-L15§() : void
      {
         this.hideDialog(this.§_-b2w§);
         this.hideDialog(this.§_-l2G§);
         this.hideDialog(this.exit);
         this.hideDialog(this.§_-p12§);
         this.hideDialog(this.§_-21P§);
         this.hideDialog(this.§_-8y§);
      }
      
      public function §_-Ez§() : void
      {
         this.hideDialog(this.§_-b2w§);
      }
      
      public function §_-H2B§() : void
      {
         this.hideDialog(this.exit);
      }
      
      public function get §_-z28§() : Boolean
      {
         return Boolean(this.§_-b2w§) && this.§_-b2w§.visible;
      }
      
      public function get §_-qj§() : Boolean
      {
         return Boolean(this.exit) && this.exit.visible;
      }
      
      public function dispose() : void
      {
         this.§_-Ef§(this.§_-b2w§);
         this.§_-Ef§(this.§_-l2G§);
         this.§_-Ef§(this.§_-21P§);
         this.§_-Ef§(this.§_-8y§);
         this.§_-j1L§ = null;
         this.§_-d2h§ = null;
         this.§_-Z1N§ = null;
         this.§_-027§ = null;
         this.§_-x2I§ = null;
         this.§_-72I§ = null;
      }
      
      private function §_-k3§(param1:String) : void
      {
         if(!param1)
         {
            return;
         }
         if(!this.§_-8y§)
         {
            this.§_-8y§ = new §_-Fk§(gls(§_-l29§),gls(param1),false,null,0,null,false);
         }
         else
         {
            this.§_-8y§.message = gls(param1);
         }
         this.§_-8y§.show();
      }
      
      private function hideDialog(param1:Dialog) : void
      {
         if(Boolean(param1) && param1.visible)
         {
            param1.hide();
         }
      }
      
      private function §_-Ef§(param1:§_-Fk§) : void
      {
         if(param1)
         {
            param1.dispose();
         }
      }
   }
}

