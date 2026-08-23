package §_-Rj§
{
   import §_-Q1P§.§_-Mh§;
   import §_-Q1P§.§_-g2J§;
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-Q13§;
   
   public class §_-y1z§
   {
      
      public static const §_-7§:String = "required";
      
      public static const §_-X1x§:String = "forbidden";
      
      public static const §_-jZ§:String = "requiredBattle";
      
      public static const §_-I22§:String = "forbiddenBattle";
      
      public static const §_-x1B§:String = "requiredDragons";
      
      public static const §_-5S§:String = "forbiddenDragons";
      
      public static const §_-Gx§:String = "requiredTwoShamans";
      
      public static const §_-q6§:String = "forbiddenTwoShamans";
      
      public static const §_-b1q§:String = "requiredSurvival";
      
      public static const §_-m1e§:String = "forbiddenSurvival";
      
      public static const §_-F2d§:String = "forbiddenRoped";
      
      public static const §_-I1d§:String = "requiredFlyAcorn";
      
      public static const §_-F2s§:String = "forbiddenFlyAcorn";
      
      public static const §_-52G§:String = "requiredZombie";
      
      public static const §_-I23§:String = "requiredVolcano";
      
      private static const §_-o2K§:String = gls("Cохранить карту");
      
      private static const §_-bi§:Object = {
         "required":gls("Сохранить карту нельзя,\nт.к. на карте должны присутствовать\nорех, обычное дупло, белка и шаман."),
         "requiredBattle":gls("Сохранить карту нельзя,\nт.к. на карте должны присутствовать\nядро, белка и шаман для каждой команды."),
         "requiredDragons":gls("Сохранить карту нельзя,\nт.к. на карте должны присутствовать\nорех, дупло и белка."),
         "requiredTwoShamans":gls("Сохранить карту нельзя,\nт.к. на карте должны присутствовать\nорех, белка, одно красное и одно\nсинее дупло, красный и синий шаман."),
         "requiredSurvival":gls("Сохранить карту нельзя,\nт.к. на карте должны присутствовать\nбелка и чёрный шаман."),
         "requiredFlyAcorn":gls("Сохранить карту нельзя,\nт.к. на карте должны присутствовать\nорех, дупло и маршрут полета ореха"),
         "requiredZombie":gls("Сохранить карту нельзя,\nт.к. на карте должны присутствовать\nбелка и зомби."),
         "requiredVolcano":gls("Сохранить карту нельзя,\nт.к. на карте должна присутствовать\nбелка.")
      };
      
      private static const §_-g2f§:Object = {
         "forbidden":gls("Сохранить карту нельзя,\nт.к. на карте не должны присутствовать\nобъекты битвы и других режимов игры."),
         "forbiddenBattle":gls("Сохранить карту нельзя,\nт.к. на карте не должны присутствовать\nобъекты других режимов игры,\nорех и дупло."),
         "forbiddenDragons":gls("Сохранить карту нельзя,\nт.к. на карте не должны присутствовать\nшаман, объекты битвы и других\nрежимов игры."),
         "forbiddenRoped":gls("Сохранить карту нельзя,\nт.к. на карте не должны присутствовать\nобъекты битвы и других режимов,\nа количество белок не должно превышать 2.\nРасстояние между белками\nдолжно быть небольшим."),
         "forbiddenTwoShamans":gls("Сохранить карту нельзя,\nт.к. на карте не должны присутствовать\nобъекты битвы и других режимов игры."),
         "forbiddenSurvival":gls("Сохранить карту нельзя,\nт.к. на карте не должны присутствовать\nорех, дупло, объекты битвы и других\nрежимов игры."),
         "forbiddenFlyAcorn":gls("Сохранить карту нельзя,\nт.к. у вас есть точка маршрута и к ней ничего не привязано")
      };
      
      private var §_-Q2V§:§_-Q13§;
      
      private var §_-Q2J§:§_-Q13§;
      
      private var exit:§_-g2J§;
      
      private var §_-n2F§:§_-Mh§;
      
      private var §_-A3D§:§_-Q13§;
      
      private var §_-N2R§:§_-Q13§;
      
      private var §_-i2v§:Function;
      
      private var §_-N1T§:Function;
      
      private var §_-j2b§:Function;
      
      private var §_-X2R§:Function;
      
      private var §_-j1q§:Function;
      
      private var §_-B7§:Function;
      
      public function §_-y1z§(param1:Function, param2:Function, param3:Function, param4:Function, param5:Function, param6:Function)
      {
         super();
         this.§_-i2v§ = param1;
         this.§_-N1T§ = param2;
         this.§_-j2b§ = param3;
         this.§_-X2R§ = param4;
         this.§_-j1q§ = param5;
         this.§_-B7§ = param6;
      }
      
      public function §_-11P§(param1:String) : void
      {
         this.§_-J1o§(§_-bi§[param1]);
      }
      
      public function §_-m1x§(param1:String) : void
      {
         this.§_-J1o§(§_-g2f§[param1]);
      }
      
      public function §_-53x§() : void
      {
         if(!this.§_-Q2V§)
         {
            this.§_-Q2V§ = new §_-Q13§(gls("Удаление карты"),gls("Ты уверен, что хочешь удалить карту?"),true,this.§_-i2v§,0,null,false);
         }
         this.§_-Q2V§.show();
      }
      
      public function §_-K2r§() : void
      {
         if(!this.§_-Q2J§)
         {
            this.§_-Q2J§ = new §_-Q13§(gls("Сохранение карты"),gls("Протестируйте карту перед отправкой"));
         }
         this.§_-Q2J§.show();
      }
      
      public function §_-Ww§() : void
      {
         if(!this.exit)
         {
            this.exit = new §_-g2J§(this.§_-X2R§,this.§_-j1q§,this.§_-B7§);
         }
         this.exit.show();
      }
      
      public function §_-I2w§() : void
      {
         if(!this.§_-n2F§)
         {
            this.§_-n2F§ = new §_-Mh§(this.§_-j2b§,this.§_-N1T§);
         }
         this.§_-n2F§.show();
      }
      
      public function §_-D2O§() : void
      {
         if(!this.§_-A3D§)
         {
            this.§_-A3D§ = new §_-Q13§(gls("Сохранить карту"),gls("У тебя недостаточно прав для сохранения этой карты в другой локации."));
         }
         this.§_-A3D§.show();
      }
      
      public function §_-c2M§() : void
      {
         this.hideDialog(this.§_-Q2V§);
         this.hideDialog(this.§_-Q2J§);
         this.hideDialog(this.exit);
         this.hideDialog(this.§_-n2F§);
         this.hideDialog(this.§_-A3D§);
         this.hideDialog(this.§_-N2R§);
      }
      
      public function §_-D5§() : void
      {
         this.hideDialog(this.§_-Q2V§);
      }
      
      public function §_-i1A§() : void
      {
         this.hideDialog(this.exit);
      }
      
      public function get §_-82x§() : Boolean
      {
         return Boolean(this.§_-Q2V§) && this.§_-Q2V§.visible;
      }
      
      public function get §_-W4§() : Boolean
      {
         return Boolean(this.exit) && this.exit.visible;
      }
      
      public function dispose() : void
      {
         this.§_-V2w§(this.§_-Q2V§);
         this.§_-V2w§(this.§_-Q2J§);
         this.§_-V2w§(this.§_-A3D§);
         this.§_-V2w§(this.§_-N2R§);
         this.§_-i2v§ = null;
         this.§_-N1T§ = null;
         this.§_-j2b§ = null;
         this.§_-X2R§ = null;
         this.§_-j1q§ = null;
         this.§_-B7§ = null;
      }
      
      private function §_-J1o§(param1:String) : void
      {
         if(!param1)
         {
            return;
         }
         if(!this.§_-N2R§)
         {
            this.§_-N2R§ = new §_-Q13§(gls(§_-o2K§),gls(param1),false,null,0,null,false);
         }
         else
         {
            this.§_-N2R§.message = gls(param1);
         }
         this.§_-N2R§.show();
      }
      
      private function hideDialog(param1:Dialog) : void
      {
         if(Boolean(param1) && param1.visible)
         {
            param1.hide();
         }
      }
      
      private function §_-V2w§(param1:§_-Q13§) : void
      {
         if(param1)
         {
            param1.dispose();
         }
      }
   }
}

