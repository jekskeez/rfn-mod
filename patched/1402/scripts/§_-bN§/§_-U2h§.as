package §_-bN§
{
   import §_-X1k§.§_-LZ§;
   import §_-c2C§.§_-si§;
   import §_-c2C§.§_-t2c§;
   import buttons.§_-K2G§;
   import events.ScreenEvent;
   import flash.display.DisplayObject;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import utils.§_-P2G§;
   
   public class §_-U2h§ extends Dialog
   {
      
      private var §_-LY§:TextField;
      
      private var §_-P2L§:§_-i5§;
      
      public function §_-U2h§()
      {
         super("",true,false);
         this.init();
      }
      
      override public function show() : void
      {
         if(this.visible || §_-LZ§.§_-mA§ < 3)
         {
            return;
         }
         if(§_-t2c§.active is §_-si§)
         {
            super.show();
            return;
         }
         §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.§_-43K§);
      }
      
      private function init() : void
      {
         var _loc1_:§_-i5§ = new §_-i5§("",0,10,new TextFormat(§_-i5§.§_-c10§,14,2039583));
         _loc1_.text = gls("Чтобы завершить создание вашего аккаунта,\nвведите адрес электронной почты:");
         addChild(_loc1_);
         var _loc2_:DisplayObject = addChild(new InviteKeyBackground());
         _loc2_.x = 45;
         _loc2_.y = 55;
         _loc2_.addEventListener(MouseEvent.CLICK,this.setFocus,false,0,true);
         this.§_-LY§ = new TextField();
         this.§_-LY§.x = 45;
         this.§_-LY§.y = 58;
         this.§_-LY§.defaultTextFormat = new TextFormat(§_-i5§.§_-c10§,15,3939591);
         this.§_-LY§.width = 205;
         this.§_-LY§.height = 23;
         this.§_-LY§.selectable = true;
         this.§_-LY§.type = TextFieldType.INPUT;
         this.§_-LY§.text = "Email";
         this.§_-LY§.addEventListener(FocusEvent.FOCUS_IN,this.§_-B2A§);
         this.§_-LY§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-Oa§);
         addChild(this.§_-LY§);
         this.§_-P2L§ = new §_-i5§("",0,this.§_-LY§.y + this.§_-LY§.height + 8,new TextFormat(§_-i5§.§_-c10§,14,16711680));
         addChild(this.§_-P2L§);
         var _loc3_:§_-K2G§ = new §_-K2G§(gls("Ок"));
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-d2b§,false,0,true);
         place(_loc3_);
         this.height = this.topOffset + this.§_-P2L§.y + this.§_-P2L§.height + this.§_-f2d§ + _loc3_.height + 45;
         _loc1_.x = int((this.width - _loc1_.width) * 0.5) - this.§_-01q§;
      }
      
      private function §_-d2b§(param1:MouseEvent) : void
      {
         if(this.§_-LY§.text == "" || this.§_-LY§.text == "Email")
         {
            this.§_-P2L§.text = gls("Введите адрес электронной почты.");
            this.§_-P2L§.x = (this.width - this.§_-P2L§.width) * 0.5 - this.§_-01q§;
            return;
         }
         if(!§_-P2G§.§_-C1z§(this.§_-LY§.text))
         {
            this.§_-P2L§.text = gls("Введён некорректный адрес электронной\nпочты.");
            this.§_-P2L§.x = (this.width - this.§_-P2L§.width) * 0.5 - this.§_-01q§;
            return;
         }
         hide();
         Game.§_-01l§({
            "name":Game.self.name,
            "sex":Game.self.sex,
            "email":this.§_-LY§.text
         });
      }
      
      private function setFocus(param1:MouseEvent) : void
      {
         Game.stage.focus = this.§_-LY§;
      }
      
      private function §_-B2A§(param1:FocusEvent) : void
      {
         if(this.§_-LY§.text != "Email")
         {
            return;
         }
         this.§_-LY§.text = "";
      }
      
      private function §_-Oa§(param1:FocusEvent) : void
      {
         if(this.§_-LY§.text != "")
         {
            return;
         }
         this.§_-LY§.text = "Email";
      }
      
      private function §_-43K§(param1:ScreenEvent) : void
      {
         if(!(param1.screen is §_-si§))
         {
            return;
         }
         §_-t2c§.instance.removeEventListener(ScreenEvent.SHOW,this.§_-43K§);
         super.show();
      }
   }
}

