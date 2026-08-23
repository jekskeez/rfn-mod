package §_-JM§
{
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.§_-C1V§;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   
   use namespace dragonBones_internal;
   
   public class §_-j2L§ implements §_-c1Q§
   {
      
      protected var §_-41Y§:Object;
      
      protected var §_-k1d§:Boolean;
      
      protected var _name:String;
      
      protected var §_-52Q§:MovieClip;
      
      protected var §_-F1b§:BitmapData;
      
      protected var §_-a12§:Number;
      
      public function §_-j2L§(param1:Object, param2:Object, param3:Number = 1, param4:Boolean = false)
      {
         super();
         this.§_-a12§ = param3;
         this.§_-k1d§ = param4;
         if(param1 is BitmapData)
         {
            this.§_-F1b§ = param1 as BitmapData;
         }
         else if(param1 is MovieClip)
         {
            this.§_-52Q§ = param1 as MovieClip;
            this.§_-52Q§.stop();
         }
         this.§_-F1X§(param2);
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get movieClip() : MovieClip
      {
         return this.§_-52Q§;
      }
      
      public function get bitmapData() : BitmapData
      {
         return this.§_-F1b§;
      }
      
      public function get scale() : Number
      {
         return this.§_-a12§;
      }
      
      public function dispose() : void
      {
         this.§_-52Q§ = null;
         if(this.§_-F1b§)
         {
            this.§_-F1b§.dispose();
         }
         this.§_-F1b§ = null;
      }
      
      public function getRegion(param1:String) : Rectangle
      {
         return this.§_-41Y§[param1];
      }
      
      protected function §_-F1X§(param1:Object) : void
      {
         this.§_-41Y§ = §_-C1V§.§_-P1P§(param1,this.§_-k1d§ ? this.§_-a12§ : 1);
         this._name = this.§_-41Y§.__name;
         delete this.§_-41Y§.__name;
      }
      
      dragonBones_internal function §_-z1u§() : void
      {
         if(!this.§_-F1b§ && Boolean(this.§_-52Q§))
         {
            this.§_-52Q§.gotoAndStop(1);
            this.§_-F1b§ = new BitmapData(this.§_-C20§(this.§_-52Q§.width),this.§_-C20§(this.§_-52Q§.height),true,16711935);
            this.§_-F1b§.draw(this.§_-52Q§);
            this.§_-52Q§.gotoAndStop(this.§_-52Q§.totalFrames);
         }
      }
      
      private function §_-C20§(param1:uint) : uint
      {
         return param1 & param1 - 1 ? uint(1 << param1.toString(2).length) : param1;
      }
   }
}

