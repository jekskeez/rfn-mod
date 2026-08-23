package §_-D26§
{
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.§_-l2g§;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   
   use namespace dragonBones_internal;
   
   public class §_-G1K§ implements §_-oM§
   {
      
      protected var §_-B3m§:Object;
      
      protected var §_-v2§:Boolean;
      
      protected var _name:String;
      
      protected var §_-T6§:MovieClip;
      
      protected var §_-zo§:BitmapData;
      
      protected var §_-Tq§:Number;
      
      public function §_-G1K§(param1:Object, param2:Object, param3:Number = 1, param4:Boolean = false)
      {
         super();
         this.§_-Tq§ = param3;
         this.§_-v2§ = param4;
         if(param1 is BitmapData)
         {
            this.§_-zo§ = param1 as BitmapData;
         }
         else if(param1 is MovieClip)
         {
            this.§_-T6§ = param1 as MovieClip;
            this.§_-T6§.stop();
         }
         this.§_-Q1L§(param2);
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get movieClip() : MovieClip
      {
         return this.§_-T6§;
      }
      
      public function get bitmapData() : BitmapData
      {
         return this.§_-zo§;
      }
      
      public function get scale() : Number
      {
         return this.§_-Tq§;
      }
      
      public function dispose() : void
      {
         this.§_-T6§ = null;
         if(this.§_-zo§)
         {
            this.§_-zo§.dispose();
         }
         this.§_-zo§ = null;
      }
      
      public function getRegion(param1:String) : Rectangle
      {
         return this.§_-B3m§[param1];
      }
      
      protected function §_-Q1L§(param1:Object) : void
      {
         this.§_-B3m§ = §_-l2g§.§_-F11§(param1,this.§_-v2§ ? this.§_-Tq§ : 1);
         this._name = this.§_-B3m§.__name;
         delete this.§_-B3m§.__name;
      }
      
      dragonBones_internal function §_-Zo§() : void
      {
         if(!this.§_-zo§ && Boolean(this.§_-T6§))
         {
            this.§_-T6§.gotoAndStop(1);
            this.§_-zo§ = new BitmapData(this.§_-P1Z§(this.§_-T6§.width),this.§_-P1Z§(this.§_-T6§.height),true,16711935);
            this.§_-zo§.draw(this.§_-T6§);
            this.§_-T6§.gotoAndStop(this.§_-T6§.totalFrames);
         }
      }
      
      private function §_-P1Z§(param1:uint) : uint
      {
         return param1 & param1 - 1 ? uint(1 << param1.toString(2).length) : param1;
      }
   }
}

