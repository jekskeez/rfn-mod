package §_-w2b§
{
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-J1a§;
   import §_-hd§.§_-01M§;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import game.mainGame.entity.§_-f1b§;
   import starling.display.Button;
   import starling.display.DisplayObject;
   import starling.display.Sprite;
   import starling.display.§_-I2q§;
   import starling.textures.Texture;
   
   public class §_-Q5§ extends starling.display.Sprite
   {
      
      private static const §_-12f§:int = 25;
      
      private static const §_-R26§:int = 110;
      
      private static const §_-616§:int = 20;
      
      private static var §_-L6§:Texture;
      
      private var view:§_-I2q§ = null;
      
      private var §_-12H§:Button = null;
      
      private var §_-91Q§:flash.display.Sprite = null;
      
      private var §_-w2F§:Class = null;
      
      private var callback:Function = null;
      
      public function §_-Q5§(param1:Class, param2:Function)
      {
         super();
         this.§_-w2F§ = param1;
         this.callback = param2;
         this.view = new §_-I2q§(§_-927§());
         this.view.y = -§_-R26§;
         this.§_-91Q§ = new BtnCastPinView();
         var _loc3_:flash.display.Sprite = §_-f1b§.§_-425§(param1) as flash.display.Sprite;
         var _loc4_:Rectangle = _loc3_.getBounds(_loc3_);
         var _loc5_:Number = Math.max(_loc4_.width,_loc4_.height);
         if(_loc5_ > §_-12f§)
         {
            _loc3_.scaleX = _loc3_.scaleY = §_-12f§ / _loc5_;
         }
         _loc3_.x = -(_loc4_.x + _loc4_.width * 0.5);
         _loc3_.y = -(_loc4_.y + _loc4_.height * 0.5);
         this.§_-91Q§.addChild(_loc3_);
         this.§_-12H§ = new Button(§_-01M§.getTexture(this.§_-91Q§,0,1,1,false,null,true));
         this.§_-12H§.addEventListener(TouchEvent.§_-qu§,this.§_-ll§);
         this.§_-12H§.§_-i18§();
         this.§_-12H§.x = §_-616§ * 0.5;
         this.§_-12H§.y = -§_-R26§;
         addChild(this.view);
         addChild(this.§_-12H§);
      }
      
      private static function §_-927§() : Texture
      {
         var _loc1_:Shape = null;
         var _loc2_:§_-I2q§ = null;
         if(!§_-L6§)
         {
            _loc1_ = new Shape();
            _loc1_.graphics.beginFill(0,0.25);
            _loc1_.graphics.moveTo(0,0);
            _loc1_.graphics.lineTo(§_-616§,0);
            _loc1_.graphics.lineTo(§_-616§ * 0.5,§_-R26§);
            _loc1_.graphics.lineTo(0,0);
            _loc1_.graphics.endFill();
            _loc2_ = §_-01M§.§_-Z1V§(_loc1_,0,1,1,null,true,true);
            §_-L6§ = _loc2_.texture;
         }
         return §_-L6§;
      }
      
      public function §_-bl§() : Class
      {
         return this.§_-w2F§;
      }
      
      public function remove() : void
      {
         this.§_-12H§.removeEventListener(TouchEvent.§_-qu§,this.§_-ll§);
         this.§_-12H§.removeFromParent(true);
         this.§_-12H§ = null;
         this.§_-91Q§ = null;
         this.view.removeFromParent();
         this.view = null;
         removeFromParent(true);
      }
      
      private function §_-ll§(param1:TouchEvent) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(param1.currentTarget as DisplayObject,§_-01Z§.§_-1Z§);
         if(Boolean(_loc2_) && this.callback != null)
         {
            this.callback(this);
         }
         param1.stopPropagation();
      }
   }
}

