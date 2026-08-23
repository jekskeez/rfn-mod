package §_-l26§
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
   import protocol.§_-U1M§;
   import utils.§_-93C§;
   
   public class §_-bI§ extends §_-e2k§
   {
      
      public var §_-k2U§:int = 0;
      
      protected var §_-r20§:TextField = new TextField();
      
      protected var §_-Uk§:TextField = new TextField();
      
      protected var §_-g2D§:TextField = new TextField();
      
      protected var §_-AD§:TextField = new TextField();
      
      protected var emblem:Bitmap = null;
      
      private var §_-53K§:String = null;
      
      public function §_-bI§()
      {
         super();
         addChild(new §_-i1J§("Клан ID:",0,0,§_-32A§.§_-53t§));
         §_-43M§.§_-22h§(this.§_-r20§,this,50,0,120,18,10);
         addChild(new §_-i1J§("Имя:",0,20,§_-32A§.§_-53t§));
         this.§_-Uk§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-ku§);
         §_-43M§.§_-22h§(this.§_-Uk§,this,30,20,120,18,15,true);
         addChild(new §_-i1J§("Вождь Клана:",0,40,§_-32A§.§_-53t§));
         §_-43M§.§_-22h§(this.§_-AD§,this,80,40,120,18,15);
         addChild(new §_-i1J§("Вождь ID:",0,60,§_-32A§.§_-53t§));
         this.§_-g2D§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-43z§);
         §_-43M§.§_-22h§(this.§_-g2D§,this,60,60,90,18,15,true);
         var _loc1_:§_-i1J§ = new §_-i1J§("<body><a href=\'event:#\'>Сменить имя</a></body>",150,20,§_-32A§.style);
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-ku§);
         addChild(_loc1_);
         _loc1_ = new §_-i1J§("<body><a href=\'event:#\'>Сменить вождя</a></body>",150,60,§_-32A§.style);
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-43z§);
         addChild(_loc1_);
         _loc1_ = new §_-i1J§("<body><a href=\'event:#\'>Удалить эмблемы</a></body>",265,60,§_-32A§.style);
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-eI§);
         addChild(_loc1_);
         this.graphics.clear();
         this.graphics.lineStyle(0.5,7829367);
         this.graphics.moveTo(0,88);
         this.graphics.lineTo(390,88);
      }
      
      override public function §_-V2M§(param1:§_-s18§) : void
      {
         this.§_-53K§ = null;
         super.§_-V2M§(param1);
      }
      
      override protected function §_-iJ§() : void
      {
         this.§_-F1H§ = new Sprite();
         this.§_-F1H§.y = 86;
         addChild(this.§_-F1H§);
         this.§_-F1H§.addChild(new §_-i1J§("Список полей:",10,0,§_-32A§.§_-53t§));
      }
      
      override public function update() : void
      {
         if(!this.§_-B1A§)
         {
            return;
         }
         var _loc1_:§_-z2g§ = this.§_-B1A§ as §_-z2g§;
         this.§_-r20§.text = _loc1_.id.toString();
         this.§_-Uk§.text = _loc1_.name;
         §_-62D§();
         this.§_-u1v§();
         §_-a1a§();
         var _loc2_:Array = _loc1_.§_-mi§(§_-z2g§.§_-e2p§);
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            this.§_-k2U§ = int(_loc2_[0]);
            this.§_-g2D§.text = this.§_-k2U§.toString();
            this.§_-AD§.text = "";
         }
      }
      
      override protected function §_-31s§(param1:Bitmap) : void
      {
         super.§_-31s§(param1);
         if(this.image)
         {
            this.image.x = 250;
            this.image.y = 10;
         }
      }
      
      private function §_-u1v§() : void
      {
         if(!this.§_-B1A§)
         {
            return;
         }
         var _loc1_:§_-z2g§ = this.§_-B1A§ as §_-z2g§;
         var _loc2_:String = _loc1_.§_-c2c§;
         if(!_loc2_)
         {
            this.§_-53K§ = null;
            this.§_-t2p§(null);
            return;
         }
         if(_loc2_ == this.§_-53K§ && this.emblem != null && this.emblem.parent == this)
         {
            return;
         }
         this.§_-53K§ = _loc2_;
         this.§_-t2p§(null);
         §_-93C§.load(_loc2_,null,this.§_-11D§,_loc2_);
      }
      
      private function §_-ku§(param1:Event) : void
      {
         if(param1 is KeyboardEvent && (param1 as KeyboardEvent).keyCode != Keyboard.ENTER)
         {
            return;
         }
         if(!this.§_-B1A§)
         {
            return;
         }
         this.§_-B1A§.entityName = this.§_-Uk§.text;
         this.§_-A23§();
      }
      
      private function §_-eI§(param1:Event) : void
      {
         if(!this.§_-B1A§)
         {
            return;
         }
         var _loc2_:§_-z2g§ = this.§_-B1A§ as §_-z2g§;
         _loc2_.photoURL = "";
         _loc2_.§_-c2c§ = "";
         this.§_-A23§();
      }
      
      private function §_-t2p§(param1:Bitmap) : void
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
         var _loc3_:Bitmap = §_-93C§.scale(_loc2_,10,10);
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
      
      private function §_-11D§(param1:Bitmap, param2:String) : void
      {
         if(!this.§_-B1A§)
         {
            return;
         }
         var _loc3_:§_-z2g§ = this.§_-B1A§ as §_-z2g§;
         if(param2 != _loc3_.§_-c2c§)
         {
            return;
         }
         this.§_-t2p§(param1);
      }
      
      private function §_-A23§() : void
      {
         if(!this.§_-B1A§)
         {
            return;
         }
         §_-MZ§.§_-w2w§(this.§_-B1A§.entityId,§_-z2g§.§_-g2n§,this.§_-B1A§.§_-Ux§());
      }
      
      private function §_-43z§(param1:Event) : void
      {
         if(param1 is KeyboardEvent && (param1 as KeyboardEvent).keyCode != Keyboard.ENTER)
         {
            return;
         }
         if(!this.§_-B1A§)
         {
            return;
         }
         var _loc2_:int = int(this.§_-g2D§.text);
         var _loc3_:§_-U1M§ = new §_-U1M§();
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         _loc3_.§_-s15§(_loc2_);
         §_-MZ§.§_-w2w§(this.§_-B1A§.entityId,§_-z2g§.§_-e2p§,_loc3_);
      }
   }
}

