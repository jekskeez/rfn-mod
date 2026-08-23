package §_-bm§
{
   import §_-C1l§.§_-a2§;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-K2c§.§_-sj§;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import game.mainGame.entity.§_-03s§;
   import starling.display.Button;
   import starling.display.DisplayObject;
   import starling.display.Sprite;
   import starling.display.§_-jH§;
   import starling.textures.Texture;
   
   public class §_-uC§ extends starling.display.Sprite
   {
      
      private static const §_-41o§:int = 25;
      
      private static const §_-p1Y§:int = 110;
      
      private static const §_-13M§:int = 20;
      
      private static var §_-A1j§:Texture;
      
      private var view:§_-jH§ = null;
      
      private var §_-o1U§:Button = null;
      
      private var §_-T1W§:flash.display.Sprite = null;
      
      private var §_-y25§:Class = null;
      
      private var callback:Function = null;
      
      public function §_-uC§(param1:Class, param2:Function)
      {
         super();
         this.§_-y25§ = param1;
         this.callback = param2;
         this.view = new §_-jH§(§_-613§());
         this.view.y = -§_-p1Y§;
         this.§_-T1W§ = new BtnCastPinView();
         var _loc3_:flash.display.Sprite = §_-03s§.§_-a2D§(param1) as flash.display.Sprite;
         var _loc4_:Rectangle = _loc3_.getBounds(_loc3_);
         var _loc5_:Number = Math.max(_loc4_.width,_loc4_.height);
         if(_loc5_ > §_-41o§)
         {
            _loc3_.scaleX = _loc3_.scaleY = §_-41o§ / _loc5_;
         }
         _loc3_.x = -(_loc4_.x + _loc4_.width * 0.5);
         _loc3_.y = -(_loc4_.y + _loc4_.height * 0.5);
         this.§_-T1W§.addChild(_loc3_);
         this.§_-o1U§ = new Button(§_-a2§.getTexture(this.§_-T1W§,0,1,1,false,null,true));
         this.§_-o1U§.addEventListener(TouchEvent.§_-N1l§,this.§_-b26§);
         this.§_-o1U§.§_-x2x§();
         this.§_-o1U§.x = §_-13M§ * 0.5;
         this.§_-o1U§.y = -§_-p1Y§;
         addChild(this.view);
         addChild(this.§_-o1U§);
      }
      
      private static function §_-613§() : Texture
      {
         var _loc1_:Shape = null;
         var _loc2_:§_-jH§ = null;
         if(!§_-A1j§)
         {
            _loc1_ = new Shape();
            _loc1_.graphics.beginFill(0,0.25);
            _loc1_.graphics.moveTo(0,0);
            _loc1_.graphics.lineTo(§_-13M§,0);
            _loc1_.graphics.lineTo(§_-13M§ * 0.5,§_-p1Y§);
            _loc1_.graphics.lineTo(0,0);
            _loc1_.graphics.endFill();
            _loc2_ = §_-a2§.§_-i2y§(_loc1_,0,1,1,null,true,true);
            §_-A1j§ = _loc2_.texture;
         }
         return §_-A1j§;
      }
      
      public function §_-F26§() : Class
      {
         return this.§_-y25§;
      }
      
      public function remove() : void
      {
         this.§_-o1U§.removeEventListener(TouchEvent.§_-N1l§,this.§_-b26§);
         this.§_-o1U§.removeFromParent(true);
         this.§_-o1U§ = null;
         this.§_-T1W§ = null;
         this.view.removeFromParent();
         this.view = null;
         removeFromParent(true);
      }
      
      private function §_-b26§(param1:TouchEvent) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(param1.currentTarget as DisplayObject,§_-sj§.§_-L23§);
         if(Boolean(_loc2_) && this.callback != null)
         {
            this.callback(this);
         }
         param1.stopPropagation();
      }
   }
}

