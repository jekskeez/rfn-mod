package §_-l26§
{
   import §_-k1c§.§_-V2t§;
   import §_-p1f§.§_-6Y§;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   
   public class §_-n20§ extends §_-e2k§
   {
      
      private var §_-Uk§:TextField = new TextField();
      
      private var §_-137§:TextField = new TextField();
      
      private var §_-92N§:TextField = new TextField();
      
      private var §_-mX§:Sprite = new Sprite();
      
      private var §_-231§:§_-V2t§;
      
      public function §_-n20§()
      {
         super();
         this.graphics.lineStyle(2,0);
         this.graphics.moveTo(0,145);
         this.graphics.lineTo(390,145);
         this.§_-mX§.addChild(new §_-i1J§("Имя:",0,0,§_-32A§.§_-53t§));
         this.§_-mX§.addChild(new §_-i1J§("NID:",150,17,§_-32A§.§_-53t§));
         this.§_-mX§.addChild(new §_-i1J§("UID:",0,17,§_-32A§.§_-53t§));
         §_-43M§.§_-22h§(this.§_-Uk§,this.§_-mX§,50,0,204,18,100,true);
         §_-43M§.§_-22h§(this.§_-137§,this,180,17,200);
         §_-43M§.§_-22h§(this.§_-92N§,this,30,17,70);
         this.§_-Uk§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-La§);
         addChild(this.§_-mX§);
         var _loc1_:§_-i1J§ = new §_-i1J§("<body><a href=\'event:#\'>Сохранить изменения</a></body>",120,35,§_-32A§.style);
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-D1w§);
         this.§_-mX§.addChild(_loc1_);
         var _loc2_:§_-i1J§ = new §_-i1J§("<body><a href=\'event:#\'>Удалить фотографию</a></body>",120,55,§_-32A§.style);
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-O2i§);
         this.§_-mX§.addChild(_loc2_);
         var _loc3_:§_-i1J§ = new §_-i1J§("<body><a href=\'event:#\'>Сбросить</a></body>",120,85,§_-32A§.style);
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-42w§);
         this.§_-mX§.addChild(_loc3_);
         var _loc4_:§_-i1J§ = new §_-i1J§("<body><a href=\'event:#\'>История платежей</a></body>",120,110,§_-32A§.style);
         _loc4_.addEventListener(MouseEvent.CLICK,this.§_-G2d§);
         this.§_-mX§.addChild(_loc4_);
      }
      
      override protected function §_-iJ§() : void
      {
         this.§_-F1H§ = new Sprite();
         this.§_-F1H§.y = 150;
         addChild(this.§_-F1H§);
         this.§_-F1H§.addChild(new §_-i1J§("Список полей:",10,0,§_-32A§.§_-53t§));
      }
      
      override public function update() : void
      {
         if(!this.§_-B1A§)
         {
            return;
         }
         var _loc1_:§_-i1a§ = this.§_-B1A§ as §_-i1a§;
         §_-62D§();
         §_-a1a§();
         if(this.§_-231§)
         {
            this.§_-231§.dispose();
         }
         this.§_-231§ = new §_-V2t§(gls("Сброс"),gls("Вы хотите точно сбросить игрока {0}, ID:{1}?",_loc1_.playerName,_loc1_.uid),this.§_-41t§);
         this.§_-Uk§.text = _loc1_.playerName;
         this.§_-137§.text = _loc1_.nid;
         this.§_-92N§.text = _loc1_.uid.toString();
      }
      
      override protected function §_-31s§(param1:Bitmap) : void
      {
         super.§_-31s§(param1);
         if(this.image)
         {
            this.image.x = 10;
            this.image.y = 35;
            if(this.image.width > this.image.height)
            {
               this.image.width = 100;
               this.image.scaleY = this.image.scaleX;
            }
            else
            {
               this.image.height = 100;
               this.image.scaleX = this.image.scaleY;
            }
         }
      }
      
      private function §_-D1w§(param1:MouseEvent = null) : void
      {
         this.§_-g1e§();
      }
      
      private function §_-42w§(param1:MouseEvent = null) : void
      {
         if(!this.§_-B1A§)
         {
            return;
         }
         if(!this.§_-231§)
         {
            return;
         }
         this.§_-231§.show();
      }
      
      private function §_-G2d§(param1:MouseEvent = null) : void
      {
      }
      
      private function §_-O2i§(param1:Event) : void
      {
         if(!this.§_-B1A§)
         {
            return;
         }
         this.§_-B1A§.photoURL = "";
         this.§_-g1e§();
      }
      
      private function §_-La§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER || !this.§_-B1A§)
         {
            return;
         }
         this.§_-B1A§.entityName = this.§_-Uk§.text;
         this.§_-g1e§();
      }
      
      private function §_-g1e§() : void
      {
         if(!this.§_-B1A§)
         {
            return;
         }
         §_-MZ§.§_-oE§(this.§_-B1A§.entityId,§_-6Y§.§_-a2u§,this.§_-B1A§.§_-Ux§());
      }
      
      private function §_-41t§() : void
      {
         if(!this.§_-B1A§)
         {
            return;
         }
         this.§_-231§.hide();
         this.§_-231§.dispose();
         §_-MZ§.§_-t2r§(this.§_-B1A§.entityId);
      }
   }
}

