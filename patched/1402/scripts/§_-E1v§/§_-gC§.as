package §_-E1v§
{
   import §_-Al§.§_-K1K§;
   import §_-bN§.§_-7y§;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   
   public class §_-gC§ extends §_-o2J§
   {
      
      private var §_-N2m§:TextField = new TextField();
      
      private var §_-Fo§:TextField = new TextField();
      
      private var §_-B1A§:TextField = new TextField();
      
      private var §_-Do§:Sprite = new Sprite();
      
      private var §_-so§:§_-7y§;
      
      public function §_-gC§()
      {
         super();
         this.graphics.lineStyle(2,0);
         this.graphics.moveTo(0,145);
         this.graphics.lineTo(390,145);
         this.§_-Do§.addChild(new §_-y1B§("Имя:",0,0,§_-A3G§.§_-v1I§));
         this.§_-Do§.addChild(new §_-y1B§("NID:",150,17,§_-A3G§.§_-v1I§));
         this.§_-Do§.addChild(new §_-y1B§("UID:",0,17,§_-A3G§.§_-v1I§));
         §_-j1d§.§_-43I§(this.§_-N2m§,this.§_-Do§,50,0,204,18,100,true);
         §_-j1d§.§_-43I§(this.§_-Fo§,this,180,17,200);
         §_-j1d§.§_-43I§(this.§_-B1A§,this,30,17,70);
         this.§_-N2m§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-QP§);
         addChild(this.§_-Do§);
         var _loc1_:§_-y1B§ = new §_-y1B§("<body><a href=\'event:#\'>Сохранить изменения</a></body>",120,35,§_-A3G§.style);
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-HQ§);
         this.§_-Do§.addChild(_loc1_);
         var _loc2_:§_-y1B§ = new §_-y1B§("<body><a href=\'event:#\'>Удалить фотографию</a></body>",120,55,§_-A3G§.style);
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-S2k§);
         this.§_-Do§.addChild(_loc2_);
         var _loc3_:§_-y1B§ = new §_-y1B§("<body><a href=\'event:#\'>Сбросить</a></body>",120,85,§_-A3G§.style);
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-H2t§);
         this.§_-Do§.addChild(_loc3_);
         var _loc4_:§_-y1B§ = new §_-y1B§("<body><a href=\'event:#\'>История платежей</a></body>",120,110,§_-A3G§.style);
         _loc4_.addEventListener(MouseEvent.CLICK,this.§_-D1K§);
         this.§_-Do§.addChild(_loc4_);
      }
      
      override protected function §_-S1T§() : void
      {
         this.§_-41V§ = new Sprite();
         this.§_-41V§.y = 150;
         addChild(this.§_-41V§);
         this.§_-41V§.addChild(new §_-y1B§("Список полей:",10,0,§_-A3G§.§_-v1I§));
      }
      
      override public function update() : void
      {
         if(!this.§_-82y§)
         {
            return;
         }
         var _loc1_:§_-823§ = this.§_-82y§ as §_-823§;
         §_-A1M§();
         §_-c1o§();
         if(this.§_-so§)
         {
            this.§_-so§.dispose();
         }
         this.§_-so§ = new §_-7y§(gls("Сброс"),gls("Вы хотите точно сбросить игрока {0}, ID:{1}?",_loc1_.playerName,_loc1_.uid),this.§_-QB§);
         this.§_-N2m§.text = _loc1_.playerName;
         this.§_-Fo§.text = _loc1_.nid;
         this.§_-B1A§.text = _loc1_.uid.toString();
      }
      
      override protected function §_-u18§(param1:Bitmap) : void
      {
         super.§_-u18§(param1);
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
      
      private function §_-HQ§(param1:MouseEvent = null) : void
      {
         this.§_-F2p§();
      }
      
      private function §_-H2t§(param1:MouseEvent = null) : void
      {
         if(!this.§_-82y§)
         {
            return;
         }
         if(!this.§_-so§)
         {
            return;
         }
         this.§_-so§.show();
      }
      
      private function §_-D1K§(param1:MouseEvent = null) : void
      {
      }
      
      private function §_-S2k§(param1:Event) : void
      {
         if(!this.§_-82y§)
         {
            return;
         }
         this.§_-82y§.photoURL = "";
         this.§_-F2p§();
      }
      
      private function §_-QP§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER || !this.§_-82y§)
         {
            return;
         }
         this.§_-82y§.entityName = this.§_-N2m§.text;
         this.§_-F2p§();
      }
      
      private function §_-F2p§() : void
      {
         if(!this.§_-82y§)
         {
            return;
         }
         §_-31Y§.§_-g28§(this.§_-82y§.entityId,§_-K1K§.§_-C1Z§,this.§_-82y§.§_-BJ§());
      }
      
      private function §_-QB§() : void
      {
         if(!this.§_-82y§)
         {
            return;
         }
         this.§_-so§.hide();
         this.§_-so§.dispose();
         §_-31Y§.§_-51o§(this.§_-82y§.entityId);
      }
   }
}

