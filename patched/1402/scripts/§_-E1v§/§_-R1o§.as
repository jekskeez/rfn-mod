package §_-E1v§
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   import utils.§_-O1T§;
   
   public class §_-R1o§ extends §_-o2J§
   {
      
      public var §_-m3§:int = 0;
      
      protected var §_-210§:TextField = new TextField();
      
      protected var §_-N2m§:TextField = new TextField();
      
      protected var §_-y1v§:TextField = new TextField();
      
      protected var §_-hV§:TextField = new TextField();
      
      protected var emblem:Bitmap = null;
      
      private var §_-O2W§:String = null;
      
      public function §_-R1o§()
      {
         super();
         addChild(new §_-y1B§("Клан ID:",0,0,§_-A3G§.§_-v1I§));
         §_-j1d§.§_-43I§(this.§_-210§,this,50,0,120,18,10);
         addChild(new §_-y1B§("Имя:",0,20,§_-A3G§.§_-v1I§));
         this.§_-N2m§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-2i§);
         §_-j1d§.§_-43I§(this.§_-N2m§,this,30,20,120,18,15,true);
         addChild(new §_-y1B§("Вождь Клана:",0,40,§_-A3G§.§_-v1I§));
         §_-j1d§.§_-43I§(this.§_-hV§,this,80,40,120,18,15);
         addChild(new §_-y1B§("Вождь ID:",0,60,§_-A3G§.§_-v1I§));
         this.§_-y1v§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-x2z§);
         §_-j1d§.§_-43I§(this.§_-y1v§,this,60,60,90,18,15,true);
         var _loc1_:§_-y1B§ = new §_-y1B§("<body><a href=\'event:#\'>Сменить имя</a></body>",150,20,§_-A3G§.style);
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-2i§);
         addChild(_loc1_);
         _loc1_ = new §_-y1B§("<body><a href=\'event:#\'>Сменить вождя</a></body>",150,60,§_-A3G§.style);
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-x2z§);
         addChild(_loc1_);
         _loc1_ = new §_-y1B§("<body><a href=\'event:#\'>Удалить эмблемы</a></body>",265,60,§_-A3G§.style);
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-J2s§);
         addChild(_loc1_);
         this.graphics.clear();
         this.graphics.lineStyle(0.5,7829367);
         this.graphics.moveTo(0,88);
         this.graphics.lineTo(390,88);
      }
      
      override public function §_-v15§(param1:§_-J2w§) : void
      {
         this.§_-O2W§ = null;
         super.§_-v15§(param1);
      }
      
      override protected function §_-S1T§() : void
      {
         this.§_-41V§ = new Sprite();
         this.§_-41V§.y = 86;
         addChild(this.§_-41V§);
         this.§_-41V§.addChild(new §_-y1B§("Список полей:",10,0,§_-A3G§.§_-v1I§));
      }
      
      override public function update() : void
      {
         if(!this.§_-82y§)
         {
            return;
         }
         var _loc1_:§_-w1k§ = this.§_-82y§ as §_-w1k§;
         this.§_-210§.text = _loc1_.id.toString();
         this.§_-N2m§.text = _loc1_.name;
         §_-A1M§();
         this.§_-21F§();
         §_-c1o§();
         var _loc2_:Array = _loc1_.§_-Is§(§_-w1k§.§_-B3d§);
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            this.§_-m3§ = int(_loc2_[0]);
            this.§_-y1v§.text = this.§_-m3§.toString();
            this.§_-hV§.text = "";
         }
      }
      
      override protected function §_-u18§(param1:Bitmap) : void
      {
         super.§_-u18§(param1);
         if(this.image)
         {
            this.image.x = 250;
            this.image.y = 10;
         }
      }
      
      private function §_-21F§() : void
      {
         if(!this.§_-82y§)
         {
            return;
         }
         var _loc1_:§_-w1k§ = this.§_-82y§ as §_-w1k§;
         var _loc2_:String = _loc1_.§_-iV§;
         if(!_loc2_)
         {
            this.§_-O2W§ = null;
            this.§_-P1e§(null);
            return;
         }
         if(_loc2_ == this.§_-O2W§ && this.emblem != null && this.emblem.parent == this)
         {
            return;
         }
         this.§_-O2W§ = _loc2_;
         this.§_-P1e§(null);
         §_-O1T§.load(_loc2_,null,this.§_-oe§,_loc2_);
      }
      
      private function §_-2i§(param1:Event) : void
      {
         if(param1 is KeyboardEvent && (param1 as KeyboardEvent).keyCode != Keyboard.ENTER)
         {
            return;
         }
         if(!this.§_-82y§)
         {
            return;
         }
         this.§_-82y§.entityName = this.§_-N2m§.text;
         this.§_-YF§();
      }
      
      private function §_-J2s§(param1:Event) : void
      {
         if(!this.§_-82y§)
         {
            return;
         }
         var _loc2_:§_-w1k§ = this.§_-82y§ as §_-w1k§;
         _loc2_.photoURL = "";
         _loc2_.§_-iV§ = "";
         this.§_-YF§();
      }
      
      private function §_-P1e§(param1:Bitmap) : void
      {
         var _loc2_:Bitmap = null;
         if(this.emblem != null && this.emblem.parent == this)
         {
            removeChild(this.emblem);
         }
         if(param1 == null)
         {
            _loc2_ = new Bitmap(new BitmapData(10,10,false,11184810));
         }
         else
         {
            _loc2_ = param1;
         }
         var _loc3_:Bitmap = §_-O1T§.scale(_loc2_,10,10);
         this.emblem = new Bitmap(_loc3_.bitmapData);
         this.emblem.x = 250;
         this.emblem.y = 65;
         if(this.emblem.width > this.emblem.height)
         {
            this.emblem.width = 10;
            this.emblem.scaleY = this.emblem.scaleX;
         }
         else
         {
            this.emblem.height = 10;
            this.emblem.scaleX = this.emblem.scaleY;
         }
         addChild(this.emblem);
      }
      
      private function §_-oe§(param1:Bitmap, param2:String) : void
      {
         if(!this.§_-82y§)
         {
            return;
         }
         var _loc3_:§_-w1k§ = this.§_-82y§ as §_-w1k§;
         if(param2 != _loc3_.§_-iV§)
         {
            return;
         }
         this.§_-P1e§(param1);
      }
      
      private function §_-YF§() : void
      {
         if(!this.§_-82y§)
         {
            return;
         }
         §_-31Y§.§_-n2O§(this.§_-82y§.entityId,§_-w1k§.§_-P26§,this.§_-82y§.§_-BJ§());
      }
      
      private function §_-x2z§(param1:Event) : void
      {
         if(param1 is KeyboardEvent && (param1 as KeyboardEvent).keyCode != Keyboard.ENTER)
         {
            return;
         }
         if(!this.§_-82y§)
         {
            return;
         }
         var _loc2_:int = int(this.§_-y1v§.text);
         var _loc3_:§_-z1i§ = new §_-z1i§();
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         _loc3_.§_-C1W§(_loc2_);
         §_-31Y§.§_-n2O§(this.§_-82y§.entityId,§_-w1k§.§_-B3d§,_loc3_);
      }
   }
}

