package §_-k1c§
{
   import §_-I10§.§_-d2x§;
   import §_-T2y§.§_-5K§;
   import §_-T2y§.§_-71o§;
   import buttons.§_-j18§;
   import events.ScreenEvent;
   import flash.display.DisplayObject;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import utils.§_-J27§;
   
   public class §_-A27§ extends Dialog
   {
      
      private var §_-If§:TextField;
      
      private var §_-51Y§:§_-22V§;
      
      public function §_-A27§()
      {
         super("",true,false);
         this.init();
      }
      
      override public function show() : void
      {
         if(this.visible || §_-d2x§.§_-z2o§ < 3)
         {
            return;
         }
         if(§_-71o§.active is §_-5K§)
         {
            super.show();
            return;
         }
         §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.§_-C2D§);
      }
      
      private function init() : void
      {
         var _loc1_:§_-22V§ = new §_-22V§("",0,10,new TextFormat(§_-22V§.§_-F2z§,14,2039583));
         _loc1_.text = gls("Чтобы завершить создание вашего аккаунта,\nвведите адрес электронной почты:");
         addChild(_loc1_);
         var _loc2_:DisplayObject = addChild(new InviteKeyBackground());
         _loc2_.x = 45;
         _loc2_.y = 55;
         _loc2_.addEventListener(MouseEvent.CLICK,this.setFocus,false,0,true);
         this.§_-If§ = new TextField();
         this.§_-If§.x = 45;
         this.§_-If§.y = 58;
         this.§_-If§.defaultTextFormat = new TextFormat(§_-22V§.§_-F2z§,15,3939591);
         this.§_-If§.width = 205;
         this.§_-If§.height = 23;
         this.§_-If§.selectable = true;
         this.§_-If§.type = TextFieldType.INPUT;
         this.§_-If§.text = "Email";
         this.§_-If§.addEventListener(FocusEvent.FOCUS_IN,this.§_-G1m§);
         this.§_-If§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-R1E§);
         addChild(this.§_-If§);
         this.§_-51Y§ = new §_-22V§("",0,this.§_-If§.y + this.§_-If§.height + 8,new TextFormat(§_-22V§.§_-F2z§,14,16711680));
         addChild(this.§_-51Y§);
         var _loc3_:§_-j18§ = new §_-j18§(gls("Ок"));
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-r§,false,0,true);
         place(_loc3_);
         this.height = this.topOffset + this.§_-51Y§.y + this.§_-51Y§.height + this.§_-JZ§ + _loc3_.height + 45;
         _loc1_.x = int((this.width - _loc1_.width) * 0.5) - this.§_-R1Y§;
      }
      
      private function §_-r§(param1:MouseEvent) : void
      {
         if(this.§_-If§.text == "" || this.§_-If§.text == "Email")
         {
            this.§_-51Y§.text = gls("Введите адрес электронной почты.");
            this.§_-51Y§.x = (this.width - this.§_-51Y§.width) * 0.5 - this.§_-R1Y§;
            return;
         }
         if(!§_-J27§.§_-c1P§(this.§_-If§.text))
         {
            this.§_-51Y§.text = gls("Введён некорректный адрес электронной\nпочты.");
            this.§_-51Y§.x = (this.width - this.§_-51Y§.width) * 0.5 - this.§_-R1Y§;
            return;
         }
         hide();
         Game.§_-tR§({
            "name":Game.self.name,
            "sex":Game.self.sex,
            "email":this.§_-If§.text
         });
      }
      
      private function setFocus(param1:MouseEvent) : void
      {
         Game.stage.focus = this.§_-If§;
      }
      
      private function §_-G1m§(param1:FocusEvent) : void
      {
         if(this.§_-If§.text != "Email")
         {
            return;
         }
         this.§_-If§.text = "";
      }
      
      private function §_-R1E§(param1:FocusEvent) : void
      {
         if(this.§_-If§.text != "")
         {
            return;
         }
         this.§_-If§.text = "Email";
      }
      
      private function §_-C2D§(param1:ScreenEvent) : void
      {
         if(!(param1.screen is §_-5K§))
         {
            return;
         }
         §_-71o§.instance.removeEventListener(ScreenEvent.SHOW,this.§_-C2D§);
         super.show();
      }
   }
}

